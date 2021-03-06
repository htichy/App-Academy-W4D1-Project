class Artwork < ApplicationRecord
  validates :title, :image_url, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: ( scope: :artist_id,
    message: "One artist cannot have multiple artworks with the same title")
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
end