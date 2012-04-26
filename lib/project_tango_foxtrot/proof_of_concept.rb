require 'reel'
require File.expand_path("../site_proxy.rb", __FILE__)

include ProjectTangoFoxtrot

port_number = 3001

Reel::Server.supervise("0.0.0.0", port_number) do |connection|
  request = connection.request

  puts "loading sites async"

  proxy1 = SiteProxy.new('http://www.google.com')
  proxy1.load_contents!
  proxy2 = SiteProxy.new('http://www.cnn.com')
  proxy2.load_contents!

  proxies = [proxy1, proxy2]

  sleep 0.35 # Wait 150ms
  content = ''
  puts 'iterating'
  content += "<h2>#{proxy1.url}</h2>"
  content += proxy1.contents
  content += "<h2>#{proxy2.url}</h2>"
  content += proxy2.contents

  connection.respond :ok, content
end

puts "running on #{port_number}"

while true do
  # HACK
end
