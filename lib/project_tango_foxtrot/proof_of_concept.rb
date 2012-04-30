require 'reel'
require File.expand_path("../echo.rb", __FILE__)

include ProjectTangoFoxtrot

port_number = 3001

Reel::Server.supervise("0.0.0.0", port_number) do |connection|
  request = connection.request

  puts "loading contents async"

  contents = [
    ['http://www.google.com', 0],
    ['http://www.isotope11.com', 0.5]
  ]
  echos = contents.map{|u| Echo.new(u[0], u[1]) }

  content = ''
  puts 'iterating'
  echos.each do |echo|
    echo.load_contents!
    content += "<h2>#{echo.future_contents}</h2>"
    content += echo.contents
  end

  sleep 0.7

  connection.respond :ok, content
  puts 'responded'
end

puts "running on #{port_number}"

while true do
  # HACK
end
