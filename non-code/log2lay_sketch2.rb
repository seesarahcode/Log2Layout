require 'win32ole'
require 'open-uri'
require 'mechanize'


path = "c:\\Users\\swheeler\\Desktop\\file.xlsx"


# Opens Excel document

excel = WIN32OLE.new('Excel.Application')

img_log = excel.Workbooks.Open(path)
img_ws = img_log.Worksheets(1)

# Pulls URLs from Excel spreadsheets

link_array = []
range = img_ws.range("A2:A4").each do |cell|  
			link_array[link_array.length + 1] = cell.Value
		end

p link_array.compact!

img_log.Close(true)
excel.Quit

# Creates /images folder in location of image log

img_folder = Dir.mkdir("images")

# For each URL, 1) access web page, 2) scan for unique images, 
#    3) download image file to /image folder


open(link_array) {|f|
   File.open("Basketry-covered_lightbulb_01.jpg","wb") do |file|
     file.puts f.read
   end
}




# site_seeker = Mechanize.new


# # If image is from Wiki: 

# image_name = "Fig1-1"

# link_array.each do |link|
# 	page = site_seeker.get(link)
# 	# page.images.each do |img|
# 	# 	img.fetch.save("images/#{image_name}.jpg")
# 	# end

# 	image_page = page.link_with(:text => "Original file").click

# 	image_page.images.each do |img|
# 		img.fetch.save("images/name.jpg")
# 	end

# end 


# Pulls the figure number from the spreadsheet, removes spaces, 
#    replaces "." with "-", and renames the image with the fig. number


