class Account < ApplicationRecord
    belongs_to :subject
    has_one :account_history
end
