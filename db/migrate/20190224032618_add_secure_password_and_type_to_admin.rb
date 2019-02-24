class AddSecurePasswordAndTypeToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column "admins", "password_digest", :string
    add_column "admins", "user_type", :string, limit: 25

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
