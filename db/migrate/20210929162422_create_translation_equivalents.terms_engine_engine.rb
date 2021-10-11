# This migration comes from terms_engine_engine (originally 20210929035907)
class CreateTranslationEquivalents < ActiveRecord::Migration[5.2]
  def change
    create_table :translation_equivalents do |t|
      t.references :feature, foreign_key: true, null: false
      t.string :content, null: false
      t.integer :language_id, null: false
      
      t.timestamps
    end
  end
end
