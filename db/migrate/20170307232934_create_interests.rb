class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.text :description
      t.user :references
      t.board :references

      t.timestamps
    end
  end
end
