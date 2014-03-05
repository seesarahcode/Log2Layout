 # Opens Excel Log

require 'win32ole'

class ExcelProcessor

	attr_accessor :spreadsheet, :image_log

	def initialize(spreadsheet, image_log={})
		@spreadsheet = spreadsheet
		@image_log = image_log
	end

	def read_spreadsheet
		excel = WIN32OLE.new('Excel.Application')
		excel.visible = false
		img_log = excel.Workbooks.Open(@spreadsheet)
		img_ws = img_log.Worksheets(1)
		 	
		 	# Set-up arrays for column values
			link_array = []
			figure_array = []

			# Pull values from Figure # column
			for row in 10..img_ws.UsedRange.Rows.Count do 
			 	cell = img_ws.Cells(row,3).value
			 	if cell != nil
			 		c = cell.sub(/(\D*)/, "fig_")
					new_cell = c.sub(/(\.)/, "-")
			 	else
			 		new_cell = ""
			 	end

			 	figure_array << new_cell
			end
		
			# Pull values from Source URL column
			for row in 10..img_ws.UsedRange.Rows.Count do 
			 	cell = img_ws.Cells(row,4).Value
				if (cell != nil) && (cell.include?("."))
			 		new_cell = cell
			 	else
			 		new_cell = ""
			 	end

			 	link_array << new_cell
			end

			# Zip arrays into hash of figure numbers and links
			@image_log = Hash[figure_array.zip(link_array)]

			# Remove blanks
			@image_log.delete_if { |k, v| k == "" }

		# Shut it down	
		excel.ActiveWorkbook.Close(0)
		excel.Quit
	end

end



# Potential refactor:
# ensure
# 	File.delete("tmpfile") if File.exist?("tmpfile")
# end

# Feature: add red highlight for rows that return multiple results