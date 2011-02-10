# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{monetra}
  s.version = "0.0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Ahern, John Kassimatis, Brian Woolley"]
  s.date = %q{2011-02-10}
  s.description = %q{A gem that uses the Monetra API to perform actions}
  s.email = ["gems@danahern.com", "yonnage@gmail.com", "bushfreakz@gmail.com"]
  s.extra_rdoc_files = ["lib/monetra.rb", "lib/monetra/configuration.rb", "lib/monetra/connection.rb", "lib/monetra/parse.rb", "lib/monetra/transaction.rb", "lib/monetra/transaction/admin.rb", "lib/monetra/transaction/engine.rb", "lib/monetra/transaction/token.rb", "lib/monetra/transaction/user.rb"]
  s.files = ["Manifest", "Rakefile", "lib/monetra.rb", "lib/monetra/configuration.rb", "lib/monetra/connection.rb", "lib/monetra/parse.rb", "lib/monetra/transaction.rb", "lib/monetra/transaction/admin.rb", "lib/monetra/transaction/engine.rb", "lib/monetra/transaction/token.rb", "lib/monetra/transaction/user.rb", "monetra.gemspec"]
  s.homepage = %q{http://github.com/winelibrary/monetra}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Monetra"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{monetra}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{A gem that uses the Monetra API to perform actions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
