# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{payme}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["LIM SAS", "Damien MATHIEU", "Julien SANCHEZ", "Herv\303\251 GAUCHER"]
  s.date = %q{2010-07-02}
  s.description = %q{Need online payment?}
  s.email = %q{damien.mathieu@lim.eu}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
     "README.md",
     "Rakefile",
     "VERSION",
     "sogenactif.gemspec",
     "spec/fixtures/config.yml",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/LIMSAS/payme}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Process online payments through the Sogenactif gateway}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/payme/request_spec.rb",
     "spec/payme/response/binary_spec.rb",
     "spec/payme/response_spec.rb",
     "spec/payme/request/params_spec.rb",
     "spec/payme/request/binary_spec.rb",
     "spec/payme/config_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

