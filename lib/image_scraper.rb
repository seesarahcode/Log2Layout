require "#{File.dirname(__FILE__)}/./excel_processor"
require 'mechanize'
require 'open-uri'
require 'logger'

class ImageScraper

	attr_accessor :log, :location

	def initialize log, location
		@log = log
		@location = location
	end

	def create_dir
		if Dir.exists?("#{File.dirname(@location)}/images")
			puts "Exists!"
		else
			Dir.mkdir("#{File.dirname(@location)}/images")
		end
	end

	def scrape
		site_seeker = Mechanize.new { |a| a.log = Logger.new("#{File.dirname(@location)}/images/scrape_summary.log") }
		#For Wiki only
		@log.each do |fig, link|
				ext = link.scan(/\..{3,4}$/)
				begin
					page = site_seeker.get(link) 
					puts "Found #{fig} at #{link}"
					img_page = page.links_with(:text => "Original file").first.click
					puts "Located original image"
					img = img_page.save!("#{File.dirname(@location)}/images/#{fig}#{ext[0]}") 
					puts "#{fig} has been saved."
				rescue
					puts "Uh-oh, something went wrong with #{fig.upcase}"
					next
				end
		end
	end

end

