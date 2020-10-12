module AirplaneLauncher
  TAKE_OFF_QUEUE = ENV.fetch("REDIS_TAKE_OFF_QUEUE")
  TAKE_OFF_PUBSUB = ENV.fetch("REDIS_TAKE_OFF_PUBSUB")

  class << self
    def launch id
      Redis.new.rpush(TAKE_OFF_QUEUE, JSON.dump({id: id}))
    end

    def start
      Rails.logger.info "starting airplane launcher service"
      Thread.new do
        subscribe
      end
    end

    def subscribe
      Redis.current.subscribe(TAKE_OFF_PUBSUB) do |on|
        on.message do |channel, msg|
          begin
            message = JSON.parse(msg)
            id = message['id']
            update_airplane_as_taken_off(id)
            ActionCable.server.broadcast 'departures', { id: id }
          rescue => e
            Rails.logger.error e
          ensure
            Rails.logger.info  "##{channel} - #{msg}"
          end
        end
      end
    end

    def update_airplane_as_taken_off id
      airplane = Airplane.find(id)
      airplane.launch!
    end
  end
end
