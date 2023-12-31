class RemoveMatchFromPoules < ActiveRecord::Migration[7.1]
  def change
    remove_reference :poules, :match, index: true, foreign_key: true
  end
end
