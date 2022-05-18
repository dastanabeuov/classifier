# frozen_string_literal: true

class ImportForXcategory
  attr_reader :file, :xcategory, :user

  def initialize(file, xcategory, user)
    @file = file
    @xcategory = xcategory
    @user = user
  end
  
  # This method imported tree data from 'xcategory' <= 'xclasses_tree_data'
  def import
    accessible_attributes = %w[title synonym description]

    sheet = open_spreadsheet(@file)
    header = sheet.row(1).map(&:downcase)

    (2..sheet.last_row).each do |row|
      ready_record = [header, sheet.row(row)].transpose.to_h
      record = [header, sheet.row(row)].transpose

      sort = []
      record.each { |data| sort << data if data[0] == 'class' }

      full_code = sort.filter_map do |data|
        next if data[1].nil?

        data[1].chomp('_')
      end.join

      if full_code.length == 1
        Xclass.find_or_create_by(full_code: full_code) do |xclass|
          xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
          xclass.user_id = @user.id
          xclass.xcategory_id = @xcategory.id
          xclass.code = full_code
        end
      elsif full_code.length == 2
        root = @xcategory.xclasses.roots.find_by(code: full_code[0])
        root.children.find_or_create_by(full_code: full_code) do |xclass|
          xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
          xclass.user_id = @user.id
          xclass.xcategory_id = @xcategory.id
          xclass.code = full_code[-1]
        end
      elsif full_code.length >= 3
        parent_code = full_code[0..-2]
        root = @xcategory.xclasses.roots.find_by(code: full_code[0])
        parent = root.descendants.at_depth(full_code.length - 2).find_by(full_code: parent_code)
        parent.children.find_or_create_by(full_code: full_code) do |xclass|
          xclass.attributes = ready_record.to_h.slice(*accessible_attributes)
          xclass.user_id = @user.id
          xclass.xcategory_id = @xcategory.id
          xclass.code = full_code[-1]
        end
      else
        raise "Unknown data format: #{@file}"
      end
    end
  end

  # This method open file if supported format
  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end