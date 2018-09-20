# This migration comes from terms_engine_engine (originally 20180608133907)
class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.references :feature, foreign_key: true, null: false

      t.timestamps
    end
  end
end
