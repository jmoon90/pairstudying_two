class StaticPage < ActiveRecord::Base
  has_no_table
  column :email, :string
  validates_presence_of :email

  def self.update_spreadsheet(contact_email)
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME"],
ENV["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title("pairstudying")
    if ss.nil?
      ss = connection.create_spreadsheet("pairstudying")
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = contact_email.email
    ws.save
  end
end
