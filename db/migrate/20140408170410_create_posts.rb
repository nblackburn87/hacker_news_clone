class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :user, :string
      t.column :votes, :int

      t.timestamps
    end
  end
end
