# This migration comes from terms_engine_engine (originally 20180615093554)
class AddDialectIdToRecording < ActiveRecord::Migration[5.1]
  def change
    add_column :recordings, :dialect_id, :integer
  end
end
