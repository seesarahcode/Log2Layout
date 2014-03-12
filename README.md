# Log2Layout 

## Features:

+ Command-line image scraper based on an Excel spreadsheet template (aka image log)
+ Pulls URLs and figure numbers from Excel spreadsheets, creates "/images" folder in location of image log, downloads image file
+ Automatically renames image files to figure numbers
+ Keeps original image extension (i.e., no mass .jpg renaming)
+ Currently only works with Wikimedia images
+ Known bugs: issues with https access, needs handling for Wiki images without Original File link


## Log2Layout Recipe

1. Install the Log2Layout gem. 

	gem install log2layout

2. Run the gem with the name of your Excel spreadsheet file as the argument.

	log2layout c:/Users/You/Desktop/image_log.xlsx

3. Magic happens (sometimes the magic can take a little while--these are high res images, after all), and suddenly an "images" folder appears beside your spreadsheet. Ta-da!


## Planned Features for When I'm a Better Programmer:

+ GUI interface (wxRuby)
+ General page scanning: will scan page for a unique <img> tag in the page's HTML and download the available image resources
+ Duplicate handling--if it pulls 2+ images, it will: 1) prefix all images with a DUP_ label, 2) highlight the Excel row in red, 3) create and automatically open a  text file log (saved to the /images folder) that provides the row number of the Excel spreadsheet that got multiple images, and a list of the image file names to be compared
+ Inserts a thumbnail of the image into the spreadsheet (creates column)
+ Generates caption text boxes in InDesign with Figure Title paragraph style applied, saved to a /resources folder






