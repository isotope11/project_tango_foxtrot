require 'reel'
require File.expand_path("../site_proxy.rb", __FILE__)

include ProjectTangoFoxtrot

port_number = 3001

Reel::Server.supervise("0.0.0.0", port_number) do |connection|
  request = connection.request

  if !request || (request.url != '/')
    puts 'not root, fuggidabowdid'
    connection.respond :ok, ''
  else
    puts "loading sites async"

    urls = [
      'http://www.google.com',
      'http://www.isotope11.com'
    ]
    proxies = urls.map{|u| SiteProxy.new(u) }

    #sleep 0.05 # Wait 150ms
    content = ''
    puts 'iterating'
    proxies.each do |proxy|
      proxy.load_contents!
      content += "<h2>#{proxy.url}</h2>"
      content += proxy.contents
    end

    connection.respond :ok, content
    puts 'responded'
  end
end

puts "running on #{port_number}"

while true do
  # HACK
end
