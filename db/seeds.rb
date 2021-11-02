require "csv"
require "json"
# require "../lib/active_record/add_reset_sequence_pk"
# database should be wiped and recreated first
Video.delete_all
ChannelCreator.delete_all
# Category.delete_all
# Category.reset_pk_sequence
# ActiveRecord::Base.connection.reset_sequence!("categories")

categoryfile = File.read("db/CA_category_id.json")

category_hash = JSON.parse(categoryfile)

category_items = category_hash["items"]

# category_items.each do |i|
#   category_name = i["snippet"]["title"]

#   category = Category.find_or_create_by(title: category_name)
# end

# now we take in the csv file and turn it into something we can parse
filename = Rails.root.join("db/top_videos.csv")

puts "Loading videos from the CSV file: #{filename}"

# # we can use csv_data variable to parse
csv_data = File.read(filename)
# # this line below is what reads in the csv file
# # need the liberal_parsing bit cause of whitespace in the titles, it was throwing errors
# #https://github.com/ruby/csv/issues/91
videos = CSV.parse(csv_data, headers: true, liberal_parsing: true, encoding: "utf-8")

# only takes in first 400 rows of my csv file which has like 65k rows
(0..400).each do |i|
  v = videos[i]
  channel_creator = ChannelCreator.find_or_create_by(name: v["channel_title"])

  # if the channel exists and is valid then do something
  if channel_creator&.valid?
    # create video here
    # this should allow us to create videos off the channel
    # thus wiring up the foreign key without us needing to specify it
    video = channel_creator.videos.create(
      title:         v["title"],
      views:         v["views"],
      description:   v["description"],
      likes:         v["likes"],
      dislikes:      v["dislikes"],
      trending_date: v["trending_date"],
      category_id:   v["category_id"]
    )

    # this syntax below is equal to
    # movie && movie.valid?
    # if it exists and is valid
    puts "Invalid video #{v['title']} #{video.errors.full_messages}" unless video&.valid?
  else
    puts "Invalid channel creator,#{v['channel_title']} for video: #{v['title']}"
  end
end

puts "Created #{ChannelCreator.count} youtube channels"
puts "Created #{Video.count} videos"
# videos.each do |v|
#   # puts v["title"]
#   # now we will create the creators as we loop through
#   # find or create by makes it so it will only create the channel once instead of duplicate entries
#   channel_creator = ChannelCreator.find_or_create_by(name: v["channel_title"])

#   # if the channel exists and is valid then do something
#   if channel_creator && channel_creator.valid?
#     # create video here
#     # this should allow us to create videos off the channel
#     # thus wiring up the foreign key without us needing to specify it
#     video = channel_creator.videos.create(
#       title:       v["title"],
#       views:       v["views"],
#       description: v["description"]
#     )

#     # this syntax below is equal to
#     # movie && movie.valid?
#     # like line 26 above in the if statement, if it exists and is valid
#     puts "Invalid video #{v['title']} #{video.errors.full_messages}" unless video&.valid?
#   else
#     puts "Invalid channel creator,#{v['channel_title']} for video: #{v['title']}"
#   end
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
