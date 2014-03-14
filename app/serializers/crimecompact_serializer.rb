class CrimecompactSerializer < ActiveModel::Serializer
  attributes :id, :survey_year, :murder_total , :sex_offense_total, :robbery_total, :aggravated_assault_total, :burglary_total, :motor_theft_total, :arson_total, :count
end
