class Comment < ApplicationRecord
    validates :user_id , presence: true
    validates :artwork_id , presence: true
    validates :body, presence: true



    belongs_to( 
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
)





end