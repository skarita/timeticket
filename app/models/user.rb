class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :listings, dependent: :destroy

  # Validation constraints
  validates :name, :email, :username, presence: true
  validates :email, uniqueness: true

  validates :username, uniqueness: true, length: {
    in: 2..400,
    },
    format: {
      without: /[^a-z0-9]/i,
      message: "no special characters or spacing"
    },
    exclusion: {
      :in => %w(login signup settings add api listing search browse archive),
      message: "has already been taken"
    }
  validates :email,
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    }

end
