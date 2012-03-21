class AddDefaultToFolowUpIntiatedInInformationRequests < ActiveRecord::Migration
  def change
    change_column_default(:information_requests, :follow_up_intiated, true)
  end
end
