class TownSerializer < ActiveModel::Serializer
  attributes :id, :name, :reps
  # :state, :longitude, :latitude
end
