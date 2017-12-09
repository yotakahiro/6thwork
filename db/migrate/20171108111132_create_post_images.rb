class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.integer :post_image
      t.string :image_id

      t.timestamps
    end
  end
end
