require "csv"

#database should be wiped and recreated first
Video.delete_all
ChannelCreator.delete_all

# now we take in the csv file and turn it into something we can parse
filename = Rails.root.join("db/top_videos.csv")

puts "Loading videos from the CSV file: #{filename}"

# we can use csv_data variable to parse
csv_data = File.read(filename)
# this line below is what reads in the csv file
# need the liberal_parsing bit cause of whitespace in the titles, it was throwing errors
#https://github.com/ruby/csv/issues/91
videos = CSV.parse(csv_data, headers:true, liberal_parsing: true, encoding: "utf-8")

videos.each do |v|
  #puts v["title"]
  # now we will create the creators as we loop through
  # find or create by makes it so it will only create the channel once instead of duplicate entries
  channel_creator = ChannelCreator.find_or_create_by(name: v["channel_title"])

  # if the channel exists and is valid then do something
  if channel_creator && channel_creator.valid?
    # create video here
  else
    puts "Invalid channel creator,#{v["channel_title"]} for video: #{v["title"]}"
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

