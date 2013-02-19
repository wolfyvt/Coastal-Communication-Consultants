class AddOrderIndexToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :order_index, :integer
  end
end
