class CreatePinCode < ActiveRecord::Migration[5.0]
  def change
    create_table :pin_codes do |t|
      t.string :pincode
      t.string :deviceToken
    end
  end
end
