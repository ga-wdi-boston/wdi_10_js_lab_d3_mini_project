class Year < ActiveRecord::Base
  belongs_to :country
  belongs_to :indicator
end
