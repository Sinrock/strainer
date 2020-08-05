Gem::Specification.new do |spec|
  spec.name          = "Strainer"
  spec.version       = "1.0"
  spec.authors       = ["Michael Ruhaak"]
  spec.email         = ["mruhaak@gmail.com"]

  spec.summary       = "Will access The Strain API to return information based on any of 4 criteria, or it can list all known strains and their attributes."
  spec.description   = "Will allow a user to retrieve strain specific information such as Name, Race, Effects & Flavor."
  spec.homepage      = "https://github.com/Sinrock"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/Sinrock"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Sinrock"
  spec.metadata["changelog_uri"] = "https://github.com/Sinrock/strainer/blob/master/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = 'strainer'
  spec.require_paths = ["lib"]
end