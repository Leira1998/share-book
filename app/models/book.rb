class Book < ApplicationRecord
  has_attached_file :document,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {},
    url: "/pdf/:hash.:extension",
    hash_secret: "abc123",
    style: { :thumb => ["200x200#", :jpg], :medium => ["500x500>", :jpg] }
  validates_attachment :document, :content_type => { :content_type => ["application/pdf"] }

  #has_attached_file :image, url: "/img/:hash.:extension", hash_secret: "abc123", style: { thumb: ["64x64#", :png], original: ["500x500>", :jpg] }
  #validates_attachment :image, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("author LIKE ?", "%#{search}%")
    where("classname LIKE ?", "%#{search}%")
  end
end
