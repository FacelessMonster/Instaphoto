class Photo < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, presence: true
  validates :description, presence: true

  if Rails.env.development?
    has_attached_file :image,
    :path => ":rails_root/public/photos/system/:attachment/:id/:style/:filename",
    :url => "/photos/system/:attachment/:id/:style/:filename",
    styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }
  end

end
