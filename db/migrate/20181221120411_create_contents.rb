class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url
      t.string :range

      t.timestamps
    end
  end
end
