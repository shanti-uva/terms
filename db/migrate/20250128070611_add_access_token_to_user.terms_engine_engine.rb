# This migration comes from terms_engine_engine (originally 20250128070332)
class AddAccessTokenToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :access_token, :string
  end
end
