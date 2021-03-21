class RemoveBoFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :bo, :string
  end
end
