require "#{File.dirname(__FILE__)}/../lib/image_scraper"
require "#{File.dirname(__FILE__)}/../lib/excel_processor"
require "mechanize"

describe ImageScraper do 

	before :all do
		@book = ExcelProcessor.new("#{File.dirname(__FILE__)}/../resources/image-log-template.xlsx")
		@book.read_spreadsheet
		@image_scraper = ImageScraper.new(@book.image_log, @book.spreadsheet)
	end

	context "#new" do
		it "should do receive @image_log from the Excel Processor object" do
			@image_scraper.log.should be_a_kind_of(Hash)
			@image_scraper.log.should_not be_empty
		end

		it "should receive the location of the spreadsheet" do
			@image_scraper.location.should == "#{File.dirname(__FILE__)}/../resources/image-log-template.xlsx"
		end
	end

	context "#create_dir" do 
		it "should create a folder called 'images'" do
			@image_scraper.create_dir
			img_dir = File.dirname(@image_scraper.location)
			File.exist?(img_dir).should be_true
		end
	end

	context "#scrape" do
		it "should handle all errors" do
			@final_log = @image_scraper.scrape
			expect { @final_log }.not_to raise_error
		end

		it "should save the image file" do
			@final_log
			File.exist?("#{File.dirname(@image_scraper.location)}/images/fig_1-1.jpg").should be_true
		end

		it "should create a scraping summary log file" do
			File.exist?("#{File.dirname(@image_scraper.location)}/images/scrape_summary.log").should be_true
		end
	end

end