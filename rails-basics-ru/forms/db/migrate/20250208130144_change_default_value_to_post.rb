class ChangeDefaultValueToPost < ActiveRecord::Migration[7.2]
  def change
    change_column_default :posts, :published, from: true, to: false
  end
end
