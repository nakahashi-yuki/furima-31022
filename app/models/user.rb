class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :last_name, format: { with: NICKNAME_REGEX }
    validates :first_name, format: { with: NICKNAME_REGEX }
    validates :L_name, format: { with: NAME_REGEX }
    validates :F_name, format: { with: NAME_REGEX }
    validates :nickname, :birthday, :password_confirmation
  end
  # PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  # validates :password, format: { with: PASSWORD_REGEX }, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items 
  has_many :purchases
  has_many :comments
end
