# This migration comes from terms_engine_engine (originally 20240829130019)
class CreateEnumerations < ActiveRecord::Migration[5.2]
  def change
    create_table :enumerations do |t|
      t.integer :context_id, null: false
      t.string  :context_type, null: false
      t.integer :value, null: false
      
      t.timestamps
    end
  end
end

