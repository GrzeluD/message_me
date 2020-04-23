class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: { case_sensitive: false } 
  has_secure_password
  has_many :messages

  scope :online, ->{ where("last_seen_at > ?", 15.minutes.ago) } 
end
