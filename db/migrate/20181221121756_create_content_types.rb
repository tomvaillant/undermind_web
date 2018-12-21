class CreateContentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :content_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
