class CreateMatchesScoresAndFencers < ActiveRecord::Migration[7.1]
  def change
    add_reference :scores, :match, foreign_key: true
    add_reference :scores, :fencer, foreign_key: true
  end
end
