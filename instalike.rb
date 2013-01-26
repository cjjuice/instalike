#!/Users/cjbordeleau/.rvm/rubies/ruby-1.9.3-p125/bin/ruby

require 'rubygems'
require 'instagram'

# configure instagram gem
Instagram.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
  config.client_id = ENV['CLIENT_ID']
end

# define tags to grab pictures to like from
selected_tags = %w(
                  dog
                  beach
                  sunset
                  photo
		  hot
                  art
                  girls
                  party
                  pink
                  instahub
                  lol
                  blue
                  like4like
)

# loop through each tag
selected_tags.each do |tag|
  
  #get 60 most recent photos from tag
  photos = Instagram.tag_recent_media(tag, {count: 60})
                                              
  photos.data.each do |photo|
    # like each photo 
    puts "starting liking #{tag} - #{photo.id}"
    begin
      Instagram.like_media(photo.id)
      puts "completed liking #{photo.id}"
    rescue Exception => e  
      puts e.message  
      sleep 600  
    end
  end
end 
