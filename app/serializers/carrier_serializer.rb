class CarrierSerializer < ActiveModel::Serializer
  attributes :carrier_code

  has_many :delays, serializer: DelaySerializer
end
