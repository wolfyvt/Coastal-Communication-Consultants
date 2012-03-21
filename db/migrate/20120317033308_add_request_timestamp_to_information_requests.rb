class AddRequestTimestampToInformationRequests < ActiveRecord::Migration
  def change
    add_column :information_requests, :request_timestamp, :datetime

  end
end
