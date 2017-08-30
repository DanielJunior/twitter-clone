class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications, cascade: true do |t|
      t.references :relationship
      t.string :message
      t.boolean :read

      t.timestamps
    end
  end
end
