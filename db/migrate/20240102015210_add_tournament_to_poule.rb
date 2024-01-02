class AddTournamentToPoule < ActiveRecord::Migration[7.1]
  def change
    add_reference :poules, :tournament, foreign_key: true
  end
end
