class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.belongs_to :user
      t.string :file_url, default: ""
      t.string :original_filename, default: ""
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
