I essentially followed these 3 steps to complete my simple scraper:
Use nokogiri and open-uri to grab the site’s HTML.
Use css selectors to grab the attributes we want for our Place instances.
Create methods that instantiate new Place instances and assign attributes.
The first step of the process is fairly easy: we use nokogiri and open-uri’s “open” method to grab the HTML and set that as the variable doc.

Using a binding.pry to open a pry session and print the doc variable produces HTML output that looks like this:

In order to grab the specific HTML elements we want for our attributes, we need to know their css selectors, which is accomplished using the element inspector in the browser’s console. This is the step that takes a lot of trial and error and a lot of exploring to get the exact right elements. I recommend clicking around with the element selector in the browser to see how each element is defined, then testing out different css selectors in your terminal. In your pry session, you can access the elements using the .css and .text methods. For example, running doc.css(“.Card”).first.text will comb through the HTML document, grab all elements with the Card css class, then return the first object in that array, and then spit out that object as plain text. You can then drill down further by chaining additional css selectors like so: doc.css(“.Card”).first.css(“h3”).text. Again, this step takes a lot of trial and error and patience to get the right css selectors. More complex sites may require you to use more specific css selectors.
Once you’ve figured out the css selectors for the attributes you want to use, you can write methods to assign the HTML elements to a Place instance and then print a list of places:

Adding Scraper.new.print_places to the bottom of the code will produce a list of places when you run this file in your terminal. The final product looks like this:

Yay!
All in all, web scraping is am awesome tool, though it does take a lot of work to get right. If a site has an easily accessible and usable API, I would definitely use that before web scraping, especially since scraping is so dependent on the HTML of a site, which could easily change over time. However, one really cool feature of web scraping is that it doesn’t just allow you to create instances of ruby classes, it also allows you to export data in different formats, including .csv and JSON. This functionality allows the potential for web developers to scrape public data from websites, store that information as JSON, and then use that information to build out their own backend API, ultimately allowing other developers to easily access the data without all the hassle of web scraping!