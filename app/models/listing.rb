class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy
  validates :name , :description , :location , :image , :price , :length , presence: true
  validates :name , uniqueness: true

end
