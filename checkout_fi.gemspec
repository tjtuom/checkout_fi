# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{checkout_fi}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Toni Tuominen"]
  s.date = %q{2010-06-14}
  s.description = %q{A tool to handle payments via Checkout.fi in ruby (and rails)}
  s.email = %q{toni@piranhadigital.fi}
  s.extra_rdoc_files = ["History.txt", "README.txt", "version.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "lib/checkout_fi.rb", "lib/checkout_fi/form_helper.rb", "lib/checkout_fi/payment.rb", "lib/checkout_fi/payment_form_builder.rb", "lib/checkout_fi/version.rb", "spec/checkout_fi_spec.rb", "spec/form_helper_spec.rb", "spec/payment_form_builder_spec.rb", "spec/payment_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "version.txt"]
  s.homepage = %q{http://github.com/tjtuom/checkout_fi}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{checkout_fi}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A tool to handle payments via Checkout}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 3.4.3"])
    else
      s.add_dependency(%q<bones>, [">= 3.4.3"])
    end
  else
    s.add_dependency(%q<bones>, [">= 3.4.3"])
  end
end
