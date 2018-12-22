class ChangeTypeToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :content_types, :type, :name
  end
end
