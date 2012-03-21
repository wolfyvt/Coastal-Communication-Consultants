class AddFollowUpToInformationRequests < ActiveRecord::Migration
  def change
    add_column :information_requests, :follow_up_intiated, :boolean

    add_column :information_requests, :follow_up_first_initiated, :datetime

  end
end
