class CreateCategoriesPostJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :posts, :categories do |t|
      t.index :post_id
      t.index :category_id
    end
  end
end
