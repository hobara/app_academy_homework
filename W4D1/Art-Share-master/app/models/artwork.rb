class Artwork < ApplicationRecord

  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id,
    message: 'must be unique for user' }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewer,
    through: :shares,
    source: :viewer

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare



end
