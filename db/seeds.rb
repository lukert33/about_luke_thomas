# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
