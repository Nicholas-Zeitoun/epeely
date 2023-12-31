class AddMatchToPoules < ActiveRecord::Migration[7.1]
  def change
    add_reference :poules, :match, foreign_key: true
  end
end
