class ImportCourse
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize attributes = {}
    attributes.each {|name, value| send("#{name}=", value)}
  end

  def persisted?
    false
  end

  def save
    imported_courses ||= load_imported_courses

    if imported_courses.map(&:valid?).all?
      imported_courses.each(&:save!)
      true
    else
      imported_courses.each_with_index do |course, index|
        course.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+1}: #{message}"
        end
      end
      false
    end
  end

  def load_imported_courses
    spreadsheet = open_spreadsheet
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      course = Course.find_by_courseID(row["ClassID"]) || Course.new
      course.note = row["ClassNote"].strip
      course.timetable = row["Lesson"].strip
      course.enroll = row["Enrollment"].to_i
      course
    end
  end

  def open_spreadsheet
    case  File.extname file.original_filename
    when ".csv" then Roo::Spreadsheet.open(file.path, extension: :csv)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
    when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end