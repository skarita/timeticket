class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy
  validates :name , :description , :language , :body , :word_count , presence: true
  validates :name , uniqueness: true

end
