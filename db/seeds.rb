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
  }
].each do |args|
  Quote.create(args)
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
    "description" => "Distance from Earth to Mars"
  }
].each do |args|
  Ratio.create(args)
end