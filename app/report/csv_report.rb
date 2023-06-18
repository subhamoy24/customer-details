require "csv"

class CsvReport
  def csv_string
    CSV.generate do |csv|
      csv << csv_header

      @records.each do |record|
        csv << csv_data(record)
      end

      csv
    end
  end
end
