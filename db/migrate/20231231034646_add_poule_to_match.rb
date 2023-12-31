class AddPouleToMatch < ActiveRecord::Migration[7.1]
  def change
    add_reference :matches, :poule, foreign_key: true
  end
end
