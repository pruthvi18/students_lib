class User < ActiveRecord::Base
    
    has_many :books, inverse_of: :user, dependent: :destroy
    
    validates :fullname, presence: true, length: {maximum: 50}
    validates :nick, presence: true, length: {maximum: 20}
    validates :room, presence: true, format: {with: /\A\d{3,4}\z/}
    validates :hostel, presence: true, format: {with: /A\w{5,13}\z/}
    validates :phonenumber, presence: true, format: {with: /\A\d{10}\z/}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
end
