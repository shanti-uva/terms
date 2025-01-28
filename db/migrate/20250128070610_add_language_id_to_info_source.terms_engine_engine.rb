# This migration comes from terms_engine_engine (originally 20250128065957)
class AddLanguageIdToInfoSource < ActiveRecord::Migration[7.1]
  def change
    add_column :info_sources, :language_id, :integer
  end
end
