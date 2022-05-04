
class Artwork < ApplicationRecord
    validates :artist_id, presence: true
    validates :title, presence: true
    validates :image_url, presence: true

    validates :title, uniqueness: {
        scope: :artist_id,
        message: '1 per artist'
    }

end