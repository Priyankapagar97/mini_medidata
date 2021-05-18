class Enrollment < ApplicationRecord
    belongs_to :study
    belongs_to :subject
end
