class ChangeDefaultToFolowUpIntiatedInInformationRequests < ActiveRecord::Migration
  def up
    change_column_default(:information_requests, :follow_up_intiated, false)
  end

  def down
    change_column_default(:information_requests, :follow_up_intiated, true)
  end
end
