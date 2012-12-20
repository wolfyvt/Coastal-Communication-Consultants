class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :website
      t.string :phone

      t.timestamps
    end
  end
end
