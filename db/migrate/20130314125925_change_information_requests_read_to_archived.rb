class ChangeInformationRequestsReadToArchived < ActiveRecord::Migration
  def up
    rename_column :information_requests, :read, :archived
  end

  def down
    rename_column :information_requests, :archived, :read
  end
end
