class CrimeSerializer < ActiveModel::Serializer
  attributes :survey_year, :murder , :sex_offense, :robbery, :aggravated_assault, :burglary, :motor_theft, :arson
end
