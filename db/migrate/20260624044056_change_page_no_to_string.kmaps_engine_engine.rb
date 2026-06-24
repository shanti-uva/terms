# This migration comes from kmaps_engine_engine (originally 20260505124154)
class ChangePageNoToString < ActiveRecord::Migration[8.1]
  def change
    change_column :pages, :start_page, :string 
    change_column :pages, :end_page, :string
  end
end
