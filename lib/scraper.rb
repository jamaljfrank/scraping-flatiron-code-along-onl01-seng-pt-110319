require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://flatironschool.com/"))
  end
  
  def get_courses
    doc = Nokogiri::HTML(open("https://flatironschool.com/"))
    doc.css("h2")
  end
  
  def make_courses
    get_courses.each do |course| 
      course = Course.new
    end
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



