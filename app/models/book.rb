class Book < ApplicationRecord

  belongs_to :user

  mount_uploader :document, DocumentUploader

  # Search function for Books search method
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
