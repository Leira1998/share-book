class Book < ApplicationRecord
  # Attachment info
  has_attached_file :document,
    url: "/pdf/:hash.:extension",
    hash_secret: "abc123",
    style: {
      :thumb => ["200x200#", :png],
      :medium => ["500x500>", :png]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :medium  => '-set colorspace sRGB -strip'
    }
    
  validates_attachment_content_type :document, :content_type => [
    "application/pdf",
    "application/doc",
    "application/vnd.ms-excel",
    "application/vnd.ms-powerpoint",
    "file/txt"
  ],
  :message => "Invalid file extension."


  # Search function for Books search method
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
