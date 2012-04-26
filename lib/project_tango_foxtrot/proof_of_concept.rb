require 'reel'
require File.expand_path("../site_proxy.rb", __FILE__)

port_number = 3001

Reel::Server.supervise("0.0.0.0", port_number) do |connection|
  request = connection.request
  external_sites = [
    'http://www.google.com',
    'http://www.slashdot.org',
    'http://www.cnn.com',
    'http://www.yahoo.com'
  ]

  proxies = external_sites.map do |url|
    p = ProjectTangoFoxtrot::SiteProxy.new url
    p.load_contents!
    p
  end
  puts "loading sites async"

  sleep 0.15 # Wait 150ms
  content = ''
  proxies.each do |p|
    content += "<h2>#{p.url}</h2>"
    content += p.contents
  end

  connection.respond :ok, content
end

puts "running on #{port_number}"

while true do
  # HACK
end
