class AddTokensToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :guest_token, :string
  end
end
