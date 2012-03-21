class Faq < ActiveRecord::Base
  before_create :set_order_attribute

  def set_order_attribute
    self.order_index = self.id if order_index.nil?
  end

end
