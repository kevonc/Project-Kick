class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :backers
      t.integer :funding
      t.integer :goal
      t.integer :city_id
      t.integer :category_id

      t.timestamps
    end
  end
end
