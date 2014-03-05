# Quick Nokogiri test
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://en.wikipedia.org/")) 

puts page

# # Quick ExcelProcessor test

# require '../lib/excel_processor.rb'

# @book = ExcelProcessor.new('c:\\Users\\Pooter\\Desktop\\file.xlsx')
# @book.read_spreadsheet
# puts @book.image_log