class AddUserIdToTabis < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM tabis;'
    add_reference :tabis, :user, null: false, index: true
  end

  def down
    remove_reference :tabis, :user, index: true
  end
end
