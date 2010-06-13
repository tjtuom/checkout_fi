
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name  'checkout_fi'
  authors  'Toni Tuominen'
  email    'toni@piranhadigital.fi'
  url      'http://github.com/tjtuom/checkout_fi'
}

