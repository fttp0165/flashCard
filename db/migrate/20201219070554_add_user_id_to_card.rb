class AddUserIdToCard < ActiveRecord::Migration[6.0]
  def change
    #add_column :cards, :user_id, :integer
    add_reference :cards, :user
  end
end
