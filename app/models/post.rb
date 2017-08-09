class Post < ApplicationRecord
  belongs_to :user
  
  def self.search(query)
    where("content LIKE ?", "%#{query}%")
  end
end
