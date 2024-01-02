class CreateTournamentsFencersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :tournaments, :fencers
  end
end
