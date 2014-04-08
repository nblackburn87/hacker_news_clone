class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :content, :text
      t.column :user, :string
      t.column :votes, :int
      t.column :commentable_id, :int

      t.timestamps
    end
  end
end
