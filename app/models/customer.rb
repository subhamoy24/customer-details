class Customer < ApplicationRecord
  enum gender: {'M': 'M', 'F': 'F'}

  validates :first_name, presence: true, length: {maximum: 254}
  validates :last_name, presence: true, length: {maximum: 254}
  validates :dob, presence: true
  validates :gender, presence: true

  def self.send_new_customer_details
    customer_ids = Customer.where(created_at: Date.today.all_day).pluck(:id)
    if customer_ids.length > 0
      ReportMailer.send_customer_details(customer_ids).deliver_now
    end
  end
end
