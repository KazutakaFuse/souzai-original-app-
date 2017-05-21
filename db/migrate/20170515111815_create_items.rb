class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
