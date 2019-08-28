require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    arr = []
    
    doc = Nokogiri::HTML(open(index_url))
    doc.css('.student-card').each do |card|
      # hash = {}
      # hash[key] = value
      hash = {
        profile_url: card.css('a').attr('href').value,
        name: card.css('.student-name').text,
        location: card.css('.student-location').text
      }
      arr << hash
    end
    
    arr
  end
  
  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    
    link = doc.css('.social-icon-container a').map do |node|
      node.attr('href')
    end
    
    binding.pry
    #icons


    # ex-hash: {
    #   :twitter=>"http://twitter.com/flatironschool",
    #   :linkedin=>"https://www.linkedin.com/in/flatironschool",
    #   :github=>"https://github.com/learn-co",
    #   :blog=>"http://flatironschool.com",
    #   :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
    #   :bio=> "I'm a school"
    # }
  end

end

# Scraper.scrape_index_page('https://learn-co-curriculum.github.io/student-scraper-test-page/')