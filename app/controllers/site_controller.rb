

class SiteController < ApplicationController

  def testimonials
    @testimonials = Testimonial.order(:order_index)
  end
end


