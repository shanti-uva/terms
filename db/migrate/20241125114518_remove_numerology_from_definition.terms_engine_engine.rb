# This migration comes from terms_engine_engine (originally 20240902131259)
class RemoveNumerologyFromDefinition < ActiveRecord::Migration[5.2]
  def change
    remove_column :definitions, :numerology
  end
end
