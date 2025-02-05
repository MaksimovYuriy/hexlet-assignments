class AddDefaultvalues < ActiveRecord::Migration[7.2]
  def up
    change_column_default :tasks, :status, from: nil, to: 'new'
    change_column_default :tasks, :completed, from: nil, to: false
  end

  def down
    change_column_default :tasks, :status, from: 'new', to: nil
    change_column_default :tasks, :completed, from: false, to: nil
  end
end
