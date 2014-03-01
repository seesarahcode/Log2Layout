# Log2Layout 

## Features:

+ Can be run through command line or GUI interface (wxRuby)
+ Creates /images folder in location of image log
+ Pulls URLs from Excel spreadsheets, downloads image file
     - If URL is not an image format, program will scan page
 		for a unique <img> tag in the page's HTML and download the
       available image resources
     - If it pulls 2+ images, it will:
           1. prefix all images with a DUP_#{n+1} label, 
           2. highlight the Excel row in red
           3. create and automatically open a  text file log (saved 
              to the /images folder) that provides the row number of 
              the Excel spreadsheet that got multiple images, and a 
              list of the image file names to be compared
+ Pulls the figure number from the spreadsheet, removes spaces, 
    replaces "." with "-", and renames the image with the fig. number

## Planned Features for When I'm a Better Programmer:

+ Generates caption text boxes in InDesign with Figure Title paragraph
    style applied, saved to a /resources folder
+ Inserts a thumbnail of the image into the spreadsheet (creates column)



