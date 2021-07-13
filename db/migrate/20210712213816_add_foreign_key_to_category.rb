class AddForeignKeyToCategory < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :categories, :shops
  end
end
