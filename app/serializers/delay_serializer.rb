class DelaySerializer < ActiveModel::Serializer
  attributes :day_of_week,
  # :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  # def monday
  #   @delays = Delay.count(:conditions => "day_of_week = 1")
  # end

  # def tuesday
  #   @delays = Delay.count(:conditions => "day_of_week = 2")
  # end

  # def wednesday
  #   @delays = Delay.count(:conditions => "day_of_week = 3")
  # end

  # def thursday
  #   @delays = Delay.count(:conditions => "day_of_week = 4")
  # end

  # def friday
  #   @delays = Delay.count(:conditions => "day_of_week = 5")
  # end

  # def saturday
  #   @delays = Delay.count(:conditions => "day_of_week = 6")
  # end

  # def sunday
  #   @delays = Delay.count(:conditions => "day_of_week = 7")
  # end

end
