class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.text :message
      t.string :email
      t.string :company
      t.string :phone_number

      t.timestamps
    end
  end
end
