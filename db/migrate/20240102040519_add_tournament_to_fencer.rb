class AddTournamentToFencer < ActiveRecord::Migration[7.1]
  def change
    add_reference :fencers, :tournament, foreign_key: true
  end
end
