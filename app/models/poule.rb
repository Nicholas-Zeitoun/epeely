class Poule < ApplicationRecord
    has_many :matches, dependent: :destroy
    has_many :fencers, through: :matches
end


