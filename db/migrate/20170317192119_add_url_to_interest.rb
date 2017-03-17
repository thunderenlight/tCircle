class AddUrlToInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :url, :string
  end
end
