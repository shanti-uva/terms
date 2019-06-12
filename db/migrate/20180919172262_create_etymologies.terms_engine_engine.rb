# This migration comes from terms_engine_engine (originally 20180905080112)
class CreateEtymologies < ActiveRecord::Migration[5.2]
  def change
    create_table :etymologies do |t|
      t.integer :context_id, null: false
      t.string :context_type, null: false
      t.text :content
      t.string :derivation
      
      t.timestamps
    end
  end
end