class DataExporterService
  attr_reader :user, :workbook, :attachment

  def initialize(user_id)
    @user = User.find user_id
    @workbook = nil
    @attachment = nil
    @tmp_path = "#{Rails.root.to_s}/tmp/exports/tests"
    puts @tmp_path
    FileUtils::mkdir_p @tmp_path
  end

  def call()
    @workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet
    # write specific type value value
    worksheet.write_number(row = 0, col = 5, 1_234_567, format = nil)
    # write value with type detection
    worksheet.write_value(row = 0, col = 5, 1_234_567, format = nil)
    # write row of values. format argument can be format object or array of format objects
    worksheet.write_row(row = 1, ["strong", 123_456, Time.now], format = nil)
    # write row to the bottom
    worksheet.append_row(["strong", 123_456, Time.now])
    content = @workbook.read_string
    filename = "export-test-#{Time.now.strftime("%Y%m%d%H%M%S")}.xlsx"
    File.open("#{@tmp_path}/#{filename}", "wb") { |f| f.write(content) }
    @attachment = OpenStruct.new(:name => filename, :path => "#{@tmp_path}/#{filename}")
  end
end
