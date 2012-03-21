class RemoveFollowUpInitiatedFromInformationRequests < ActiveRecord::Migration
  def up
    remove_column :information_requests, :follow_up_first_initiated
    remove_column :information_requests, :follow_up_intiated
  end

  def down
    add_column :information_requests, :follow_up_first_initiated
    add_column :information_requests, :follow_up_intiated
  end
end
