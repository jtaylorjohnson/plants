class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :kind
      t.integer :user_id
    end
  end
end
