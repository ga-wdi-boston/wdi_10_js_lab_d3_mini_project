class TownSerializer < ActiveModel::Serializer
  attributes :name, :value,

  # def state_name
  #   if defined? object.state = nil
  #     state_name = "not available"
  #   else
  #     state_name = "#{object.state}"
  #   end
  # end

  def value
    if defined? object.reps = nil
      value = 1
    else
      value = "#{object.reps}"
    end
  end
end
