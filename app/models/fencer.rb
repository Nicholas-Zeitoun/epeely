class Fencer < ApplicationRecord
    has_one_attached :photo
    has_many :scores
    has_many :matches, through: :scores
end
