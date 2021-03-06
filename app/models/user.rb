class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # belongs_to :books
  attachment :profile_image, destroy: false
  validates :introduction, length: {maximum: 50}, uniqueness: true
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
end
