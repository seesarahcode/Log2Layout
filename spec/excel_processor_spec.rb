require "#{File.dirname(__FILE__)}/../lib/excel_processor"

describe ExcelProcessor do

	before :each do
		@book = ExcelProcessor.new("c:\\Users\\Pooter\\Desktop\\file.xlsx")
	end

	context "#new" do
		it "should have the spreadsheet point to a file that exists" do
			File.exist?(@book.spreadsheet).should be_true
		end

		it "should create an empty hash for image log" do 
			@book.image_log.should be_a_kind_of(Hash)
			@book.image_log.length.should eq 0
		end
	end

	context "#read_spreadsheet" do
		# Refactor: create new test object to reduce repetitiveness
		it "should open Excel and populate image log" do
			@book.read_spreadsheet
			@book.image_log.should_not be_empty
		end

		it "should return an @image_log length of 6" do
			@book.read_spreadsheet
			@book.image_log.length.should eq 6
		end

		it "should match the right figure numbers with the right links" do
			@book.read_spreadsheet
			@book.image_log.fetch("Fig. 1.1").should eq "http://commons.wikimedia.org/wiki/File:Basketry-covered_lightbulb_01.jpg"
		end

	end

	context "#rm_non_links" do

		it "should remove any nil pairs from @image_log" do
			@book.read_spreadsheet
			@book.rm_non_links
			@book.image_log.should_not include "nil" => "nil"
		end

		it "should remove anything that doesn't look like a web address" do
			@book.read_spreadsheet
			@book.rm_non_links
			@book.image_log.should_not include "Fig. 9.1" => "Original (photo taken by author)"
			@book.image_log.should_not include "Fig. 10.2" => "Environmental Science: Earth as a Living Planet"
		end

	end

end