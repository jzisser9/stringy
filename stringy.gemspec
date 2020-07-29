require_relative 'lib/stringy/version'

Gem::Specification.new do |spec|
  github_url = "https://www.github.com/jzisser9/stringy"

  spec.name          = "stringy"
  spec.version       = Stringy::VERSION
  spec.authors       = ["Jonathan Zisser"]
  spec.email         = ["jzisser9@gmail.com"]

  spec.summary       = "A collection of utility functions involving or acting on String objects."
  spec.homepage      = github_url
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = github_url
  spec.metadata["changelog_uri"] = github_url

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
