class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column :caption, :string
      t.column :location, :string
      t.column :collection_id, :integer
    end
  end
end
