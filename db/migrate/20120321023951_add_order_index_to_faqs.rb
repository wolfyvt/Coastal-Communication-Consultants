class AddOrderIndexToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :order_index, :integer

  end
end
