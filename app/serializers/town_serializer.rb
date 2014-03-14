class TownSerializer < ActiveModel::Serializer
  attributes :id, name:, state:, longitude:, latitude:
end
