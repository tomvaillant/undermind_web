class AddSourcesCategoriesAndContentTypesToContents < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :source, foreign_key: true
    add_reference :contents, :category, foreign_key: true
    add_reference :contents, :content_type, foreign_key: true
  end
end
