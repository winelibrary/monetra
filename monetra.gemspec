# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "monetra"
  s.version = "0.1.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Ahern, John Kassimatis, Brian Woolley"]
  s.date = "2012-02-01"
  s.description = "A gem that uses the Monetra API to perform actions"
  s.email = ["gems@danahern.com", "yonnage@gmail.com", "bwoolley@gmail.com"]
  s.extra_rdoc_files = ["lib/monetra.rb", "lib/monetra/configuration.rb", "lib/monetra/connection.rb", "lib/monetra/parse.rb", "lib/monetra/transaction.rb", "lib/monetra/transaction/admin.rb", "lib/monetra/transaction/engine.rb", "lib/monetra/transaction/token.rb", "lib/monetra/transaction/user.rb"]
  s.files = ["Manifest", "Rakefile", "lib/monetra.rb", "lib/monetra/configuration.rb", "lib/monetra/connection.rb", "lib/monetra/parse.rb", "lib/monetra/transaction.rb", "lib/monetra/transaction/admin.rb", "lib/monetra/transaction/engine.rb", "lib/monetra/transaction/token.rb", "lib/monetra/transaction/user.rb", "monetra.gemspec"]
  s.homepage = "http://github.com/winelibrary/monetra"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Monetra"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "monetra"
  s.rubygems_version = "1.8.10"
  s.summary = "A gem that uses the Monetra API to perform actions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
