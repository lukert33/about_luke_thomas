require 'open-uri'
#=====Quotes

[
  {
    "author" => "William Blake",
    "excerpt"  => "If the fool would persist in his folly he would become wise.",
    "source" => "The Marriage of Heaven and Hell"
  },

  {
    "author" => "William Blake",
    "excerpt"  => "Every thing possible to be believ'd is an image of the truth.",
    "source" => "The Marriage of Heaven and Hell"
  },

  {
    "author" => "William Blake",
    "excerpt"  => "Every thing possible to be believ'd is an image of the truth.",
    "source" => "The Marriage of Heaven and Hell"
  },

  {
    "author" => "F. Scott Fitzgerald",
    "excerpt"  => "This kind of battle was invented by Lewis Carroll and Jules Verne and whoever wrote Undine, and country deacons bowling and marraines in Marseilles and girls seduced in the back lanes of Wurtemburg and Westphalia. Why, this was a love battle—there was a century of middle-class love spent here. This was the last love battle.",
    "source" => "Tender is the Night"
  },

  {
    "author" => "Mary Shelley",
    "excerpt" => "my dreams were all my own; I accounted for them to nobody; they were my refuge when annoyed—my dearest pleasure when free.",
    "source" => "Frankenstein, Introduction to the 1831 Edition"
  },

  {
    "author" => "William Shakespeare",
    "excerpt" => "In my school-days, when I had lost one shaft,\n
      I shot his fellow of the self-same flight\n
      The self-same way with more advised watch,\n
      To find the other forth, and by adventuring both\n
      I oft found both",
    "source" => "Bassanio, in 'The Merchant of Venice'"
  },

  {
    "author" => "Jonathan Ive",
    "excerpt" => "I had a sense of the values of the people who made it.",
    "source" => "In 'The New Yorker', reflecting on his first use of a Mac"
  },

  {
    "author" => "Bertrand Russell",
    "excerpt" => "I said [Wittgenstein] was mad and he said, 'God preserve me from sanity.' (God certainly will.)",
    "source" => "Russell's 1913 correspondence with a friend"
  },

  {
    "author"=>"Edgar Allen Poe",
    "excerpt"=> "There is reason, it is said, in the roasting of eggs, and there is philosophy even in furniture — a philosophy nevertheless which seems to be more imperfectly understood by Americans than by any civilized nation upon the face of the earth.",
    "source"=>"The Philosophy of Furniture"
  }

].each do |args|
  q = Quote.new(args)
  q.guest_token = "germinate"
  q.save
end


#===== Ratios

[
  {
    "number"=> "2,590",
    "description"=> "% increase since 1993 in the annual sales of vinyl records in the US"
  },

  {
    "number" => "41",
    "description"=> "Active Wars in 1983"
  },

  {
    "number" => "140,000,000",
    "description" => "Miles from Earth to Mars"
  },

  {
    "number" => "80,0000",
    "description" => "Age, in years, of 'Pando', a Quaking Aspen tree in Utah"
  },

  {
    "number" => "10,000",
    "description" => "Est. frequency of reproduction, in years, of endolithic microorganisms, living 1.5 miles beneath the ocean floor"
  },

  {
    "number" => "65",
    "description" => "Number of countries involved in wars on March 3, 2015",
  },

  {
    "number" => "615",
    "description" => "Number Militias-guerrillas and separatist groups involved in wars on March 3, 2015"
  },

  {
    "number"=> "53,891",
    "description"=> "Median annual US household income as of June 2014, in USD"
  },

  {
    "number"=>"781",
    "description"=> "Median annual Liberian household income as of Dec 2013, in USD"
  },

  {
    "number"=>"9,733",
    "description"=>"Worldwide median annual household income as of Dec 2013, in USD"
  },

  {
    "number"=>"3:1",
    "description"=> "Height of Olympus Mons relative to height of Mount Everest"
  },

  {
    "number"=>"2,305,800",
    "description"=>"Average cubic feet of water that flow over Victoria Falls each minute."
  }
].each do |args|
  Ratio.create(args)
end


#Billboard Songs

def year_scrape(uri)
  output = []
  page = Nokogiri::HTML(open(uri))
  table = page.css("div.view-content").first.css("tbody")

  table.css("tr").each do |week|
    entry = {}
    entry[:month_day]   = week.css("span.date-display-single").text
    entry[:track]  = week.css("td.views-field-field-chart-item-song").text
    entry[:artist] = week.css("td.views-field-field-chart-item-artist").text
    output << entry
  end
  output
end

def parse_scraped_dates(years)
  output = []
  years.each do |year, weeks|
    weeks.each do |week|
      make_date_strings!(week)
      ready_args = {}
      ready_args[:year] = year.to_s
      ready_args[:day]  = week[:day].to_s
      ready_args[:month] = week[:month].to_s
      ready_args[:track] = week[:track].to_s
      ready_args[:artist] = week[:artist].to_s
      output << ready_args
    end
  end
  output
end

def make_date_strings!(entry)
  string = entry[:month_day]
  string.gsub!(/^\s+/, "")
  string.gsub!(/\s+$/, "")
  string.gsub!(/\n/, "")
  dates = string.split(" ")
  entry[:month] = dates[0]
  entry[:day] = dates[1]
end

def scrape_billboard
  scraped_years = {}
  years = (1958..2014)
  years.each do |year|
    uri = "http://www.billboard.com/archive/charts/#{year}/hot-100"
    scraped_years[year.to_s] = year_scrape(uri)
  end
  scraped_years
end

def billboard_to_db!
  scrape = scrape_billboard
  parsed = parse_scraped_dates(scrape)
  saves = []
  parsed.each do |week|
    song = BillboardSong.new(week)
    saves << song.save
  end
  p "Saved " + saves.select{|e| e == true }.count.to_s + " entries"
end

billboard_to_db!