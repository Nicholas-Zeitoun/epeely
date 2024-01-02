class AddPouleToTournament < ActiveRecord::Migration[7.1]
  def change
    add_reference :tournaments, :poule, foreign_key: true
  end
end
