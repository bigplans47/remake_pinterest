class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.column :title, :string

      t.timestamp
    end
  end
end
