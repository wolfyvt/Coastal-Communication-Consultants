class AddDefaultOrderIndexToFaqs < ActiveRecord::Migration
  def change
    change_table :faqs do |t|
      t.integer :order_index, :default => :id
    end
  end
end
