class Country < ActiveRecord::Base
  has_many :years
  has_many :indicators, through: :years
end
