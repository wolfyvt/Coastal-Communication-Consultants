class CreateInformationRequests < ActiveRecord::Migration
  def change
    create_table :information_requests do |t|
      t.string :submitter_name
      t.string :patient_name
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
  end
end
