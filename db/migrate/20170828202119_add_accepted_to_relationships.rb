class AddAcceptedToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :accepted, :boolean , :default => false
  end
end
