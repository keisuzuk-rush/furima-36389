class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  VALID_NAME_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :first_name_kanji, presence: true, format: { with: VALID_NAME_KANJI_REGEX }
  validates :last_name_kanji,  presence: true, format: { with: VALID_NAME_KANJI_REGEX }
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana,  presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :last_name_kana,   presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday,         presence: true
end
