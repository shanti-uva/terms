# This migration comes from terms_engine_engine (originally 20221215194304)
class AddPositionToInfoSource < ActiveRecord::Migration[5.2]
  def change
    add_column :info_sources, :position, :integer, null: false, default: 0
  end
end
