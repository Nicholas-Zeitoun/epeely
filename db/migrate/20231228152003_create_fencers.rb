class CreateFencers < ActiveRecord::Migration[7.1]
  def change
    create_table :fencers do |t|
      t.string :name
      t.string :points

      t.timestamps
    end
  end
end
