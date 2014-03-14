# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  group      :string(255)
#  region     :string(255)
#  currency   :string(255)
#

class Country < ActiveRecord::Base
  has_many :years
  has_many :indicators, through: :years
end
