class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, password_length: 7..128
  devise :database_authenticatable, :validatable, email_regexp: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  has_one :address
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
end
