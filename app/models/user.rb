class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :items

  VALID_NAME_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: { with: VALID_NAME_KANJI_REGEX }
    validates :last_name_kanji,  format: { with: VALID_NAME_KANJI_REGEX }
    validates :first_name_kana,  format: { with: VALID_NAME_KANA_REGEX }
    validates :last_name_kana,   format: { with: VALID_NAME_KANA_REGEX }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
