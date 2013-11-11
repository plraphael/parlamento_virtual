class Api::V1::MessengerController < ApplicationController
  # include ActionController::Live
 
  # def connect
  #   player = params[:token]
  #   puts player
  #   response.headers["Content-Type"] =  "text/event-stream"
  #   begin
  #     redis = Redis.new
  #     redis.psubscribe("messages.*") do |on|
  #       on.pmessage do |pattern,event,data|
  #         if pattern == "messages.player.#{player}" or not pattern =~ /messages\.player\..+/
  #           data = JSON.parse(data).merge({event: event})
  #           response.stream.write "data: #{data.to_json}\n\n"
  #           puts "#{request.remote_ip} > data: #{data.to_json}\n\n"
  #         else
  #           puts "#{request.remote_ip} > Not my  Token\n\n"
  #         end
  #       end
  #     end
  #   rescue IOError
  #     logger.info "Stream Close"
  #   ensure
  #     response.stream.close
  #   end
  # end
end
