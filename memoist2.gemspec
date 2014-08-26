# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "memoist2"
  s.version = "0.2.1-mmior.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Rudy Jacobs"]
  s.date = "2013-07-19"
  s.email = "MatthewRudyJacobs@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = [".gitignore", ".rspec", ".ruby-version", ".travis.yml", "Gemfile", "LICENCE", "README.md", "Rakefile", "benchmark.rb", "example/foo.rb", "lib/memoist2.rb", "memoist2.gemspec", "spec/memoist2_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "https://github.com/matthewrudy/memoist2"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.0.3"
  s.summary = "Really simple memoization for ruby 2.0"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
