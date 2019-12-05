class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profiel_image_id, :string
  end
end
