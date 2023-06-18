class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, limit: 254
      t.string :last_name, null: false, limit: 254
      t.date :dob, null: false
      t.column :gender, "ENUM('M','F')", null: false
      t.timestamps
    end
  end
end
