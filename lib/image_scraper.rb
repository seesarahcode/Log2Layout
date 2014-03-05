require "#{File.dirname(__FILE__)}/./excel_processor"
require 'nokogiri'
require 'open-uri'

class ImageScraper

	attr_accessor :log, :location

	def initialize log, location
		@log = log
		@location = location
	end

	def create_dir
		if Dir.exists?("#{File.dirname(@location)}/images")
			return "Exists!"
		else
			Dir.mkdir("#{File.dirname(@location)}/images")
		end
	end

	def image_scrape
		# Sets HTTP access for each value (URL)
		@log.each do |k, v|
			if v.include? "wikipedia" || v.include? "wikimedia"
				# go to wiki scrape

			else
				# go to general scrape
				
			end
		end

	end

	def wiki_scrape
		puts "you've arrive to wiki scrape"
		# Scans and locates original image file
		# Downloads file
	end

	def general_scrape
		puts "you've arrive to the general scrape"
		# Scans and locates non-nav image files
	end

	def dup_handler
		# Handles the renaming/numbering of files from rows with multiple results
		# Creates folder for dups
	end

	def logger
		# Creates text files of rows with multiple results
	end

end

# open(link_array) {|f|
#    File.open("Basketry-covered_lightbulb_01.jpg","wb") do |file|
#      file.puts f.read
#    end
# }