class Photo < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true
  has_attached_file :picture, :storage => :s3, :url => ":s3_domain_url", :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "picture/:id/:filename"
end
