class Poule < ApplicationRecord
    belongs_to :tournament
    has_many :matches, dependent: :destroy
    has_many :fencers, through: :matches
end


