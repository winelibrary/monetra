require 'rubygems'
require 'psych'
require 'rake'
require 'echoe'
YAML::ENGINE.yamler = 'syck'
Echoe.new('monetra', '0.1.18') do |p|
  p.description    = "Wine Library Monetra gem to interface with their API"
  p.url            = "http://github.com/winelibrary/monetra"
  p.author         = ["Dan Ahern", "John Kassimatis", "Brian Woolley"]
  p.email          = ["gems@danahern.com", "yonnage@gmail.com", "bwoolley@gmail.com"]
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.dependencies = ["builder", "yaml", "csv"]
  p.development_dependencies = []
end