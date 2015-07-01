class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :author, index: true, foreign_key: true
  end
end
