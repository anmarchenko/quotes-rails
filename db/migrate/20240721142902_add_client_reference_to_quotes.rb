class AddClientReferenceToQuotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :quotes, :client, null: false, foreign_key: true
  end
end
