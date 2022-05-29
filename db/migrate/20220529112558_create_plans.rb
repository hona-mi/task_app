class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.date :starting_date
      t.date :ending_date
      t.boolean :checkbox
      t.string :introduction

      t.timestamps
    end
  end
end
