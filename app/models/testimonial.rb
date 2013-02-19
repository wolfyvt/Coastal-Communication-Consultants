class Testimonial < ActiveRecord::Base
  attr_accessible :testimonial_text, :written_by, :order_index
end
