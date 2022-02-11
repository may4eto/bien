class Review < ApplicationRecord
    # add an association that has one-to-many relationship
    has_many :comments
    has_many :bookmarks
    belongs_to :user

    geocoded_by :address
    after_validation :geocode

    #add the photo uploader
    mount_uploader :photo, PhotoUploader

    validates :title, presence: true
    validates :body, length: {minimum: 50}
    validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
    validates :restaurant, presence: true
    validates :address, presence: true

    def to_param 
        id.to_s + "-" + title.parameterize
    end
end
