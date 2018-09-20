# This migration comes from terms_engine_engine (originally 20180827094104)
class CreatePassages < ActiveRecord::Migration[5.2]
  def change
    create_table :passages do |t|
      t.integer :context_id, null: false
      t.string :context_type, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
