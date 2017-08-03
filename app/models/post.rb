class Post < ApplicationRecord
  def self.search(query)
    where("content LIKE ?", "%#{query}%")
  end
end
