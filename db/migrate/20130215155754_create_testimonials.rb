class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text :testimonial_text
      t.string :written_by

      t.timestamps
    end
  end
end
