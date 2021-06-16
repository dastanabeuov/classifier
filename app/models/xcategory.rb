class Xcategory < ApplicationRecord
  belongs_to :user
  belongs_to :xroot, touch: true

  has_many :xclasses, dependent: :destroy
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 2 }

  def self.import(file, xcategory)
    accessible_attributes = %w[title synonym description]
    sheet = open_spreadsheet(file)
    header = sheet.row(1)
    (2..sheet.last_row).each do |row|
      ready_record = Hash[[header.map(&:downcase), sheet.row(row)].transpose]
      record = [header.map(&:downcase), sheet.row(row)].transpose
      sort = []
      record.each {|data| sort << data if data[0] == 'class'}      
      full_code = sort.map do |data|
        next if data[1].nil?
        data[1].chomp('_')
      end
      join_code = full_code.join

      if join_code.length == 1
        xclass = Xclass.new
        xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
        xclass.user_id = Current.user.id
        xclass.xcategory_id = xcategory.id
        xclass.code = join_code
        xclass.save!
      elsif join_code.length == 2
        root = xcategory.xclasses.roots.find_by_code(join_code[0])
        xclass = root.children.new
        xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
        xclass.user_id = Current.user.id
        xclass.xcategory_id = xcategory.id
        xclass.code = join_code[-1]
        xclass.save!
      elsif join_code.length >= 3
        root = xcategory.xclasses.roots.find_by_code(join_code[0])
        parent = root.descendants.at_depth(join_code.length - 2).find_by_code(join_code[-2])
        xclass = parent.children.new
        xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
        xclass.user_id = Current.user.id
        xclass.xcategory_id = xcategory.id
        xclass.code = join_code[-1]
        xclass.save!
      else
        nil
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end