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

		it "should start with 'fig_'" do
			@book.read_spreadsheet
			@book.image_log.has_key?("fig_8-8").should be_true
			@book.image_log.has_key?("fig_2").should be_true
		end

		it "should replace periods between numbers with dashes" do
			@book.read_spreadsheet
			@book.image_log.has_key?("fig_1-1").should be_true
		end

		it "should match the right figure numbers with the right links" do
			@book.read_spreadsheet
			@book.image_log.fetch("fig_1-1").should eq "http://commons.wikimedia.org/wiki/File:Basketry-covered_lightbulb_01.jpg"
		end

		it "should remove any pairs with blank values" do
			@book.read_spreadsheet
			@book.image_log.has_key?("").should be_false
		end

		it "should return an @image_log length of 4" do
			@book.read_spreadsheet
			@book.image_log.length.should eq 4
		end

	end


end