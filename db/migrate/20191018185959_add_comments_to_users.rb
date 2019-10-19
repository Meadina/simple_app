# frozen_string_literal: true

class AddCommentsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comment, :text
  end
end
