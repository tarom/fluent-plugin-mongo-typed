# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fluent-plugin-mongo-typed}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MORIYA Taro"]
  s.date = %q{2013-02-15}
  s.description = %q{Typed mongo output plugin}
  s.email = %q{taro.toys@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "fluent-plugin-mongo-typed.gemspec",
    "lib/fluent/mixin/mongo_typed_mixin.rb",
    "lib/fluent/plugin/out_mongo_replset_typed.rb",
    "lib/fluent/plugin/out_mongo_typed.rb",
    "test/helper.rb",
    "test/plugin/test_out_mongo_replset_typed.rb",
    "test/plugin/test_out_mongo_typed.rb"
  ]
  s.homepage = %q{http://github.com/tarom/fluent-plugin-mongo-typed}
  s.licenses = ["Apache License 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Typed mongo output plugin}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_runtime_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
    else
      s.add_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
    end
  else
    s.add_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<fluent-plugin-mongo>, [">= 0.6.13"])
  end
end

