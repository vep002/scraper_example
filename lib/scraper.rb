require 'nokogiri'
require 'open-uri'
require 'pry'


require_relative './place.rb'

class Scraper

# Grab the HTML document
    def get_page
    doc = Nokogiri::HTML(open("https://www.atlasobscura.com/unusual-trips")) 
    end

#Select the HTML element that contains the information you want to iterate over to create your instances
    def get_places
       self.get_page.css(".Card") 
    end

# Iterate over the array produced by the above step, instantiate new Place instances, and assign attributes
    def make_places
        self.get_places.each do |card|
        place = Place.new
        place.title = card.css("h3").text
        place.price = card.css("span.trip-fees span").text
        end
    end  

#Print out your Place instances
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

#adding this to the bottom of the code will produce a list of places when you run this file in your terminal
Scraper.new.print_places
