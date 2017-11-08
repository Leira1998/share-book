class Book < ApplicationRecord
  has_attached_file :document,
    url: "/pdf/:hash.:extension",
    hash_secret: "abc123",
    style: { :thumb => ["200x200#", :jpg], :medium => ["500x500>", :jpg] }
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/doc", "text/txt"]

  #has_attached_file :image, url: "/img/:hash.:extension", hash_secret: "abc123", style: { thumb: ["64x64#", :png], original: ["500x500>", :jpg] }
  #validates_attachment :image, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }

  def self.search(search)
    where("title LIKE ? OR author LIKE ? OR classname LIKE ?", "%#{search}%")
  end
end
