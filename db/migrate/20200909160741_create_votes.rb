# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
    add_index :votes, :article_id
    add_index :votes, :user_id
  end
end
