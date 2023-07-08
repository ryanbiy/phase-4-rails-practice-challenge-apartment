class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :number

  has_many :tenants
  has_many :leases, through: :tenants

end
