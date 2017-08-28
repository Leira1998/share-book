class Book < ApplicationRecord
  has_attached_file :image,
    url: "/img/:hash.:extension",
    hash_secret: "abc123",
    style: { thumb: ["64x64#", :png], original: ["500x500>", :jpg] }
  validates_attachment :image,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }

  # has_attached_file :document, url: "pdf/:hash.:extension", hash_secret: "abc123"
  # validates_attachment :document, :content_type => { :content_type => ["application/pdf"] }
end
