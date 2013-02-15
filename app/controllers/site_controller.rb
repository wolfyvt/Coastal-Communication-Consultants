

class SiteController < ApplicationController

  def testimonials
    @testimonials = Testimonial.all
  end
end
