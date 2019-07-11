class DropHosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :hosts do |t|
    t.string :first_name
    t.string :last_name
    t.string :email
    t.string :password_digest
    t.string :image
  end
end
end
