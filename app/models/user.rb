class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :managements

  validates :nickname, presence: true 
  validates :birth_day, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX },length: { minimum: 6 }
  VALID_USERNAME_REGEX = /\A[ぁ-んァ-ン一-龥]/ 
    validates :first_name, presence: true, format: { with: VALID_USERNAME_REGEX }
    validates :last_name, presence: true, format: { with: VALID_USERNAME_REGEX }
  VALID_USERNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name_kana,presence: true, format: { with: VALID_USERNAMEKANA_REGEX }
    validates :last_name_kana,presence: true, format: { with: VALID_USERNAMEKANA_REGEX }
end 