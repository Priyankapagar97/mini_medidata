class Subject < ApplicationRecord
    has_one :address, as: :addressable
    # has_and_belongs_to_many :studies
    before_create :dump_subject

    has_one :account
    has_one :account_history, through: :account
    has_many :enrollments
    has_many :studies, through: :enrollments

    validates :name, :age, presence: true
    validates :blood_group, presence: true, inclusion: { in: ['b+', 'a+', 'b-', 'o-'] }

    def dump_subject
		puts "This is object: #{subject.to_json}"
		response = Faraday.post('http://localhost:3001/subjects') do |request|
			request.headers = { 'Content-Type' => 'application/json'}
			request.body = { subject: self }.to_json
		end
		binding.pry
		response.status == 201 #created
	end 

end
