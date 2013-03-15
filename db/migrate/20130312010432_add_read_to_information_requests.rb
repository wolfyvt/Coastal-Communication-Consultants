class AddReadToInformationRequests < ActiveRecord::Migration
  def change
    add_column :information_requests, :read, :boolean
  end
end
