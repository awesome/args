# vim: ft=ruby

Gem::Specification.new do |s|
  s.name        = "args"
  s.version     = "0.0.0"
  s.authors     = ["Richo Healey"]
  s.email       = ["richo@psych0tik.net"]
  s.homepage    = "http://github.com/richo/args"
  s.summary     = "Argument parsing for ruby"
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  if ENV['GEM_PRIVATE_KEY']
    s.signing_key = "#{ENV['GEM_PRIVATE_KEY']}/gem-private_key.pem"
    s.cert_chain  = ["#{ENV['GEM_PRIVATE_KEY']}/gem-public_cert.pem"]
  end
end


