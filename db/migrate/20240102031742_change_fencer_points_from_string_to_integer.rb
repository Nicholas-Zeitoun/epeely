class ChangeFencerPointsFromStringToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :fencers, :points, 'integer USING CAST(points AS integer)'
  end
end
