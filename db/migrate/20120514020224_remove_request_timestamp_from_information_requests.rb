class RemoveRequestTimestampFromInformationRequests < ActiveRecord::Migration
  def up
    remove_column :information_requests, :request_timestamp
  end

  def down
    add_column :information_requests, :request_timestamp
  end
end
