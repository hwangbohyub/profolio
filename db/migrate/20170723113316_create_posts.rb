class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.string :file_url, default: ""
      t.string :original_filename, default: "empty"
      t.text :content

      t.timestamps
    end
  end
end
