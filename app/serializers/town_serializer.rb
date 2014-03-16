class TownSerializer < ActiveModel::Serializer
  attributes :name, :repetition, :state_name

  def state_name
    if defined? object.state = nil
      state_name = "not available"
    else
      state_name = "#{object.state}"
    end
  end

  def repetition
    if defined? object.reps = nil
      repetition = 1
    else
      repetition = "#{object.reps}"
    end
  end
end
