class YearSerializer < ActiveModel::Serializer
  has_one :indicator

  attributes :id, :value, :name
end
