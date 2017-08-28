class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.references :user, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
