class RemovePouleFromTournament < ActiveRecord::Migration[7.1]
  def change
    remove_reference :tournaments, :poule, index: true, foreign_key: true
  end
end
