class AddOrderIndexToResources < ActiveRecord::Migration
  def change
    add_column :resources, :order_index, :integer

  end
end
