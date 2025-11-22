class User < ApplicationRecord
  has_secure_password

  GENDERS = %w[male female]

  has_many :sessions, dependent: :destroy

  validates :fio, presence: true
  validates :phone, format: /\A\+?\d{10,15}\z/
  validates :gender, inclusion: { in: GENDERS }, allow_nil: true
end
