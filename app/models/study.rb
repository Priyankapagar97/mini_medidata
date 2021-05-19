class Study < ApplicationRecord
    validates_presence_of :name, :drug
    validates_numericality_of :age_limit, :greater_than_age => 7
    validates_numericality_of :phase, :less_than_phase => 5

    after_save :send_email
    belongs_to :study_group, optional: true
    # belongs_to :study_group
    has_many :sites
    has_many :enrollments
    has_many :subjects, through: :enrollments

    has_one_attached :my_image do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end

    belongs_to :study_group, touch: true
    has_many :participants

    scope :under_trials, -> { where("phase < 4") }

  def self.usable_drugs
    where("phase >= 4")
  end

  private

  def send_email
    StudyMailer.with( study: @study ).success_email.deliver_later
  end
end
