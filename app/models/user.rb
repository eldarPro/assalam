class User < ApplicationRecord
  has_secure_password

  GENDERS = %w[male female]

  has_many :sessions, dependent: :destroy
  has_many :comments
  has_many :bookmarks
  has_many :subscriptions

  validates :fio, presence: true
  validates :phone, allow_nil: true, format: /\A\+?\d{7,15}\z/
  validates :gender, inclusion: { in: GENDERS }, allow_nil: true
end
