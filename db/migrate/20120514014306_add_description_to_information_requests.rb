class AddDescriptionToInformationRequests < ActiveRecord::Migration
  def change
    add_column :information_requests, :description, :text

  end
end
