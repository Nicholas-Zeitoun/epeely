class Match < ApplicationRecord
    has_many :scores, dependent: :destroy
    has_many :fencers, through: :scores
end
