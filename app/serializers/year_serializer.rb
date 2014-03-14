class YearSerializer < ActiveModel::Serializer
  has_one :indicator

  attributes :value, :name
end
