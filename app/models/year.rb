# == Schema Information
#
# Table name: years
#
#  id           :integer          not null, primary key
#  country_id   :integer
#  indicator_id :integer
#  value        :decimal(, )
#  name         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Year < ActiveRecord::Base
  belongs_to :country
  belongs_to :indicator
end
