class DeparturesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "departures"
  end
end
