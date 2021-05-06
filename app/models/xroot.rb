class Xroot < ApplicationRecord
  belongs_to :user

  has_many :xcategories, dependent: :destroy
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 2 }

  def self.import(file)
    accessible_attributes = [ 'title', 'synonym', 'description' ]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      xroot = find_by_id(row["id"]) || Xroot.new
      xroot.attributes = row.to_hash.slice(*accessible_attributes)
      xroot.user_id = Current.user.id
      xroot.save!
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
