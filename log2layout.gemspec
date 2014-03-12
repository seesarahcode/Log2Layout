# GemSpec file

Gem::Specification.new do |s|
	s.name = "log2layout"
	s.version = "0.0.1"
	s.date = "2014-02-15"
	s.summary = "Scraper for Wikimedia images."
	s.description = "Pulls Wiki URLs from Excel spreadsheet and automates image downloading."
	s.authors = ["Sarah W."]
	s.email = "sarahcwheeler@smail.com"
	s.homepage = "http://rubygems.org/gems/log2layout"
	s.licenses = ['MIT']
	s.files = Dir["README.md", "Gemfile", "spec/*", "lib/*"]
	s.add_development_dependency "rspec", "~>2.0"
end