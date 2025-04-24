# This migration comes from blog (originally 20250424114728)
class CreateBlogPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_posts do |t|
      t.string :title

      t.timestamps
    end
  end
end
