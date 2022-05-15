class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      has_one_attached:image
      
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active , null: false, default: "TRUE"
      t.timestamps
    end
  end
end
