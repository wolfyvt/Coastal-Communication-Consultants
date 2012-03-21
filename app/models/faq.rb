class Faq < ActiveRecord::Base
  after_create :set_order_attribute 

  def set_order_attribute
    self.order_index = self.id 
    self.save
  end

end
