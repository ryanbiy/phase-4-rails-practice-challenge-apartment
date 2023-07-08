class Apartment < ApplicationRecord
    NAMES = ['Riverside Gardens', 'Oakwood Apartments', 'Parkview Residences', 'Meadowbrook Heights', 'Sunset Terrace']
    validates :name, inclusion: {
        in: NAMES, 
        message: "must be one of: #{NAMES.join(', ')}"
    }

    has_many :leases, dependent: :destroy
    has_many :tenants, through: :leases
end
