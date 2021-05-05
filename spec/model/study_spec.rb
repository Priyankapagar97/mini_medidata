require "rails_helper"

describe Study, type: :model do
    context 'when study do not have a name' do
        it 'is valid' do
            study = Study.new(name: '')
            expect(study.valid?).to eq false
        end
    end

    context 'when study do not have age_limit greater than 7' do
        it 'is valid' do
            study = Study.new(age_limit: 6)
            expect(study.valid?).to eq false
        end
    end

    context 'when study do not have a drug' do
        it 'is valid' do
            study = Study.new(drug: '')
            expect(study.valid?).to eq false
        end
    end

    context 'when study do not have phase less than or equal to 5' do
        it 'is valid' do
            study = Study.new(phase: 8)
            expect(study.valid?).to eq false
        end
    end

end