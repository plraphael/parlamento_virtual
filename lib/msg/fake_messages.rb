class FakeMessages
  def self.infiniteloop
    redis = Redis.new
    sequence = 0
    while true
      time = Time.now.strftime("%H:%M:%S")
      sequence += 1
      message = {message: "Notif #{sequence}: #{time}"}
      out = redis.publish('messages.create',message.to_json)
      sleep_wait = rand(5)
      puts "#{sequence} will wait #{sleep_wait} [Redis:#{out}]"
      sleep sleep_wait
    end
  end

  def self.watch_redis
    redis = Redis.new
    redis.psubscribe("*") do |on|
      on.pmessage do |pattern,event,data|
        data = JSON.parse(data).merge({event: event})
        puts "data: #{data.to_json}\n\n"
      end
    end
  end
end