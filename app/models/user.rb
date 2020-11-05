class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :L_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :F_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :nickname
    validates :birthday
  end
  # PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  # validates :password, format: { with: PASSWORD_REGEX }, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true

end
