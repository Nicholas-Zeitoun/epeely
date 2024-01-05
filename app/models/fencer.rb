class Fencer < ApplicationRecord
    has_one_attached :photo
    has_many :scores
    has_many :matches, through: :scores
    has_and_belongs_to_many :tournaments

    def calculate_score
        # debug
    end
end
