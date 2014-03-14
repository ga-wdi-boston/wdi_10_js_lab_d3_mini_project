class Indicator < ActiveRecord::Base
  has_many :years
  has_many :countries, through: :years
end
