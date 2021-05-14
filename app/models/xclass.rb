class Xclass < ApplicationRecord
  belongs_to :user
  belongs_to :xcategory, touch: true
  
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true
  
  has_ancestry

  validates :title, presence: true, length: { minimum: 2 }

  def self.import(file)
    accessible_attributes = [ 'title', 'synonym', 'description' ]
    
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      if spreadsheet.cell('B', i).to_s.length >= 1 && spreadsheet.cell('C', i) == nil
        xclass = find_by_id(row["id"]) || Xclass.new
        xclass.attributes = row.to_hash.slice(*accessible_attributes)
        # xclass.xcategory_id =
        xclass.user_id = Current.user.id
        xclass.save!
      # elsif spreadsheet.cell('A', i).to_s.length >= 2
      #   title = spreadsheet.cell('D', i)
      #   xroot = Xroot.where(title: title).first
      #   xcategory = xroot.xcategories.build.attributes = row.to_hash.slice(*accessible_attributes)
      #   xcategory.user_id = Current.user.id
      #   xcategory.save!
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
