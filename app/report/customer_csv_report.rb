class CustomerCsvReport < CsvReport
  def initialize(customer_ids)
    @records = Customer.where(id: customer_ids)
  end

  def csv_header
    [
      "Customer ID",
      "First Name",
      "Last Name",
      "Date of Birth",
      "Gender"
    ].freeze
  end

  def csv_data(customer)
    [
      customer.id,
      customer.first_name,
      customer.last_name,
      customer.dob,
      customer.gender
    ]
  end
end