# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130314125925) do

  create_table "administrators", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.text     "answer",      :limit => 255
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "order_index"
  end

  create_table "information_requests", :force => true do |t|
    t.string   "submitter_name"
    t.string   "patient_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
    t.boolean  "archived"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "website"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "order_index"
  end

  create_table "testimonials", :force => true do |t|
    t.text     "testimonial_text"
    t.string   "written_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "order_index"
  end

end
