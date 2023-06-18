class ReportMailer < ApplicationMailer
  def send_customer_details(customer_ids)
    csv_string = CustomerCsvReport.new(customer_ids).csv_string
    attachments["customer_report_#{I18n.l(Date.today)}.csv"] = { mime_type: "text/csv", content: csv_string }
    mail(to: "tech@htzoop.com", subject: "Today New Customers")
  end
end