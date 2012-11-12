# -*- encoding : utf-8 -*-
module ApplicationHelper 

  def custom_event_options
    events = Event.all.map do |e|
      [e.name,e, {:event_time => e.time.to_s}]
  	end
    return options_for_select(events)
  end


end
