class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :origin
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
