class AddDefaultValuesToPosts < ActiveRecord::Migration[7.2]
  def change
    change_column_default :posts, :published, to: false
  end
end
