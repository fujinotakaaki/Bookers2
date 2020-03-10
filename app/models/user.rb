class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :postcode, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :introduction, length: { maximum: 50 }

  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :follows, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  def followed_by?( follower_user_id )
    # logger.debug 'ここみろ'
    # logger.debug self.inspect
    Relationship.where( follower_id: follower_user_id )&.find_by( follow_id: id ).present?
  end
end
