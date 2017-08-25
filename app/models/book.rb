class Book < ApplicationRecord
  has_attached_file :image, style: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, :content_type => { :content_type => "image/jpg" }
end
