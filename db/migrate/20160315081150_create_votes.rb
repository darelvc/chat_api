class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.references :user, foreign_key: true, index: true
      t.column :kind, :integer

      t.timestamps null: false
    end

    add_index :votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end
