class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, password_length: 7..128
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true
  validates :first_name, :last_name, presence: true
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  has_one :address

end
