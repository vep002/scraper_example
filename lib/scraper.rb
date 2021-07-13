require 'nokogiri'
require 'open-uri'
require 'pry'


require_relative './place.rb'

class Scraper

    def get_page
    doc = Nokogiri::HTML(open("https://www.atlasobscura.com/unusual-trips")) 
    end

    def get_places
       self.get_page.css(".Card") 
    end

    def make_places
        self.get_places.each do |card|
        place = Place.new
        place.title = card.css("h3").text
        place.price = card.css("span.trip-fees span").text
        end
    end  

    def print_places
        self.make_places
        Place.all.each do |place|
          if place.title && place.title != ""
            puts "Title: #{place.title}"
            puts "Price: #{place.price}"
          end
        end
    end
end

Scraper.new.print_places
