class Pass < ApplicationRecord
  belongs_to :user
  has_many :impressions, :as=>:impressionable

  def self.search(query)
    where("title LIKE ?", "%#{query}%")
  end

  def impression_count
    impressions.size
  end

  def unique_impression_count
      # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
      # so getting keys from the hash and calculating the number of keys
      impressions.group(:ip_address).size.keys.length #TESTED
  end
end
