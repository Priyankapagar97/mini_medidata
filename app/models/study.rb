class Study < ApplicationRecord
    validates_presence_of :name, :drug
    validates_numericality_of :age_limit, :greater_than_age => 7
    validates_numericality_of :phase, :less_than_phase => 5
end
