class ChangeFaqAnswerFromStringToText < ActiveRecord::Migration
  def up
    change_column :faqs, :answer, :text
  end

  def down
    change_column :my_table, :answer, :string
  end
end
