require 'sinatra'
require File.expand_path("../echo.rb", __FILE__)

include ProjectTangoFoxtrot

port_number = 3001

get '/' do
  puts "loading contents async"

  contents = [
    ['immediate', 0],
    ['delayed', 0.1]
  ]
  echos = contents.map{|u| Echo.new(u[0], u[1]) }

  content = ''
  puts 'iterating'
  echos.each do |echo|
    echo.load_contents!
  end
  sleep 0.2

  echos.each do |echo|
    content += "<h2>#{echo.future_contents}</h2>"
    content += echo.contents
  end

  content
end
