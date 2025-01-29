# This migration comes from terms_engine_engine (originally 20250129042042)
class ChangeLanguageIdToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :info_sources, :language_id, false
  end
end
