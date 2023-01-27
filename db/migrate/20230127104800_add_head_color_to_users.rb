class AddHeadColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :head_color, :string, default: "#370617"
  end
end
