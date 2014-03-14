class CountrySerializer < ActiveModel::Serializer
  has_many :years

  attributes :name, :code
end
