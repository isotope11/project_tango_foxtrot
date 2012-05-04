# Proof of Concept: guaranteed time-to-render
# ------
# The purpose of this demonstration is to show that regardless of a
# slow-performing query, the request is replied to in a guaranteed minimum time
# frame.  This is a desirable trait for quite a few systems, and is also a nice
# benefit that's not hard to gain in an SOA-style system.
require 'sinatra'
require File.expand_path("../echo.rb", __FILE__)

include ProjectTangoFoxtrot

port_number = 3001

get '/' do
  puts "loading contents async"

  contents = [
    ['immediate', 0],
    ['delayed', 0.1],
    ['too long', 0.3]
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
