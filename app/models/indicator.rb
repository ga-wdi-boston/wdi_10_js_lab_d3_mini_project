# == Schema Information
#
# Table name: indicators
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Indicator < ActiveRecord::Base
  has_many :years
  has_many :countries, through: :years
end
