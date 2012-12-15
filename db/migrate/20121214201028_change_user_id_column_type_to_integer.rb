class ChangeUserIdColumnTypeToInteger < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.remove :user_id
      t.integer :user_id 
    end
  end
end
