class RenameColumnInImages < ActiveRecord::Migration
  def change
    rename_column :images, :path, :avatar
  end
end
