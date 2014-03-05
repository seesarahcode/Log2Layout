require "#{File.dirname(__FILE__)}/../lib/image_scraper"
require "#{File.dirname(__FILE__)}/../lib/excel_processor"

describe ImageScraper do 

	before :each do
		@book = ExcelProcessor.new("c:\\Users\\Pooter\\Desktop\\file.xlsx")
		@book.read_spreadsheet
		@image_scraper = ImageScraper.new(@book.image_log, @book.spreadsheet)
	end

	context "#new" do
		it "should do receive @image_log from the Excel Processor object" do
			@image_scraper.log.should be_a_kind_of(Hash)
			@image_scraper.log.should_not be_empty
		end

		it "should receive the location of the spreadsheet" do
			@image_scraper.location.should == "c:\\Users\\Pooter\\Desktop\\file.xlsx"
		end
	end

	context "#create_dir" do 

		it "should create a folder called 'images'" do
			@image_scraper.create_dir
			@img_dir = File.dirname(@image_scraper.location)
			File.exist?(@img_dir).should be_true
		end

	end

end