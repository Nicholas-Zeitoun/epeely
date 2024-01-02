class Tournament < ApplicationRecord
    has_many :poules, dependent: :destroy
    has_many :fencers
end
