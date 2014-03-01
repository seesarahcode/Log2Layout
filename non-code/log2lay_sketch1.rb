require 'win32ole'
require 'open-uri'
require 'mechanize'

	# path = "c:\\Users\\swheeler\\Desktop\\file.xlsx"


	# # Opens Excel document

	# excel = WIN32OLE.new('Excel.Application')

	# img_log = excel.Workbooks.Open(path)
	# img_ws = img_log.Worksheets(1)

	# # Pulls URLs from Excel spreadsheets

	# link_array = []
	# range = img_ws.range("A2:A4").each do |cell|  
	# 			link_array[link_array.length + 1] = cell.Value
	# 		end

	# p link_array.compact!

	# img_log.Close(true)
	# excel.Quit

# Creates /images folder in location of image log

link_array = ["http://commons.wikimedia.org/wiki/File:Sun_rays_at_Hopi_Point_Grand_Canyon_2013.jpg",
"http://commons.wikimedia.org/wiki/File:Nickel_electrolytic_and_1cm3_cube.jpg",
"http://commons.wikimedia.org/wiki/File:Capri_-_7224.jpg"]

img_folder = Dir.mkdir("images")

# For each URL, 1) access web page, 2) scan for unique images, 
#    3) download image file to /image folder

site_seeker = Mechanize.new

# If image is from Wiki: 

image_name = "Fig1-1"

link_array.each do |link|
	page = site_seeker.get(link)
	page.images.download(link, "images/Fig1-1.jpg")
end



# Pulls the figure number from the spreadsheet, removes spaces, 
#    replaces "." with "-", and renames the image with the fig. number


