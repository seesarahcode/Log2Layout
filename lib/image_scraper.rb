require "#{File.dirname(__FILE__)}/./excel_processor"

class ImageScraper

	def initialize log, homepath
		@log = log
		@homepath = homepath
	end

	def create_dirs
	end

	def f_strip
		# Sets up the figure numbers for image saving
		@full_log.each_key do |key|
			# strip periods
			# replace space with 
			# capitalize
		end
	end

	def open_page
	end

	def wiki_scrape
		# Scans and locates original image file
		# Downloads file
	end

	def dup_handler
		# Handles the renaming/numbering of files from rows with multiple results
	end

	def logger
		# Creates text files of rows with multiple results
	end

end



# # Creates /images folder in location of image log

# img_folder = Dir.mkdir("images")

# # For each URL, 1) access web page, 2) scan for unique images, 
# #    3) download image file to /image folder


# open(link_array) {|f|
#    File.open("Basketry-covered_lightbulb_01.jpg","wb") do |file|
#      file.puts f.read
#    end
# }