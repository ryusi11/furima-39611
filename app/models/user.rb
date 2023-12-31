class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字で入力されていません"}

  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字で入力されていません"}

  validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "全角カナで入力されていません"}

  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "全角カナで入力されていません"}

  has_many :items
  has_many :orders

end
