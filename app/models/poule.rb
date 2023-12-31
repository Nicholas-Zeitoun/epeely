class Poule < ApplicationRecord
    has_many :matches
    has_many :fencers
end


