class Book < ApplicationRecord

  # Search function for Books search method
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
