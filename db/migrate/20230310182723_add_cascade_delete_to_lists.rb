class AddCascadeDeleteToLists < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :items, :lists
    add_foreign_key :items, :lists, on_delete: :cascade
  end
end

