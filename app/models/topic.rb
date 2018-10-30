class Topic < ApplicationRecord
  validates :user_id,presence: true
  validates :description, presence: true
  validates :image, presence: true, size: {less_than_or_equal_to: 10.megabytes }
  validates :image, type: {allow:['image/jpeg', 'image/jpg', 'image/png']}

  belongs_to :user

  mount_uploader :image, ImageUploader
end
