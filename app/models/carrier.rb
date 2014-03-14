class Carrier < ActiveRecord::Base
  has_many :delays
end
