class Study < ApplicationRecord
    validates_presence_of :name, :drug
    validates_numericality_of :age_limit, :greater_than_age => 7
    validates_numericality_of :phase, :less_than_phase => 5

    belongs_to :study_group
    has_many :sites
    has_many :enrollments
    has_many :subjects, through: :enrollments
end
