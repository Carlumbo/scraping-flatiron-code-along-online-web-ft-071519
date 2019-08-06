require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_reader :get_page, :get_courses
  
  def get_page
   doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    doc.css("post").each do |post|
      course = Course.new 
      course.title = post.css("h2")
      course.schedule = post.css(".date")
      course.description = post.css("p").text
 
  end 
  
  Scraper.new.get_page
  def get_courses
  end 
    
  
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



