class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url
      t.string :type
      t.string :category
      t.string :source
      t.integer :range

      t.timestamps
    end
  end
end
