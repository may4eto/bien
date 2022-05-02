class User < ApplicationRecord
    has_many :reviews
    has_many :comments
    has_many :bookmarks
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    def to_param 
        username
    end
end
