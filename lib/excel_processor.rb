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

			# Pull values from columns

			for row in 10..img_ws.UsedRange.Rows.Count do 
			 	cell = img_ws.Cells(row,3).Value
			 	figure_array << cell
			end

			for row in 10..img_ws.UsedRange.Rows.Count do 
			 	cell = img_ws.Cells(row,4).Value
			 	link_array << cell
			end


			# Zip darrays into hash of figure numbers and links
			@image_log = Hash[figure_array.zip(link_array)]

		# Shut it down	
		excel.ActiveWorkbook.Close(0)
		excel.Quit
	end

	def rm_non_links
		# Removes pairs with values that aren't a valid web page/image
		@image_log.delete_if {| k, v | k == nil }
		@image_log.each do | k, v |
			if v.scan(/\s*\.\s*/) == true
				continue
			else
				@image_log.delete(k)
			end
		end

	end

end




# ensure
# 	File.delete("tmpfile") if File.exist?("tmpfile")
# end