class DataExporterService
  attr_reader :user, :workbook

  def initialize(user_id)
    @user = User.find user_id
    @workbook = nil
  end

  def call()
    @workbook = FastExcel.open(constant_memory: true)
    @workbook = FastExcel.open("data-export.xlsx")
    worksheet = workbook.add_worksheet
    # write specific type value value
    worksheet.write_number(row = 0, col = 5, 1_234_567, format = nil)
    # write value with type detection
    worksheet.write_value(row = 0, col = 5, 1_234_567, format = nil)
    # write row of values. format argument can be format object or array of format objects
    worksheet.write_row(row = 1, ["strong", 123_456, Time.now], format = nil)
    # write row to the bottom
    worksheet.append_row(["strong", 123_456, Time.now])
  end
end
