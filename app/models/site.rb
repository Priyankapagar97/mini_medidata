class Site < ApplicationRecord
    has_one :address, as: :addressable
end
