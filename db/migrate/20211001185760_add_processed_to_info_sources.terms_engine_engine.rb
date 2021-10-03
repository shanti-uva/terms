# This migration comes from terms_engine_engine (originally 20211001175610)
class AddProcessedToInfoSources < ActiveRecord::Migration[5.2]
  def change
    add_column :info_sources, :processed, :boolean, null: false, default: false
  end
end
