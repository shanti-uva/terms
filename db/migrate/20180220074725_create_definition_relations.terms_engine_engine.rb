# This migration comes from terms_engine_engine (originally 20180219235654)
class CreateDefinitionRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :definition_relations do |t|
      t.integer :child_node_id, null: false
      t.integer :parent_node_id, null: false
      t.string :ancestor_ids

      t.timestamps
    end
  end
end
