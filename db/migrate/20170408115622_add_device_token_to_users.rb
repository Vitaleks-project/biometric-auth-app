class AddDeviceTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deviceToken, :string
  end
end
