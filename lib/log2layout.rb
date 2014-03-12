#!/usr/bin/env ruby

require_relative './image_scraper.rb'
require_relative './excel_processor.rb'

#TO RUN MANUALLY ON THE COMMAND LINE

excel_path = ARGV.first || "#{File.dirname(__FILE__)}/./resources/image-log-template.xlsx"

@book = ExcelProcessor.new(excel_path)
@book.read_spreadsheet
@book.image_log

@image_scraper = ImageScraper.new(@book.image_log, @book.spreadsheet)
@image_scraper.create_dir
@image_scraper.scrape
