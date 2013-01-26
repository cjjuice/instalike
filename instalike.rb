require 'rubygems'
require 'instagram'

# configure instagram gem, make sure to set token and id from http://instagram.com/developer/
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

  error_count = 0
                                            
  photos.data.each do |photo|
    # like each photo 
    puts "starting liking #{tag} - #{photo.id}"
    begin
      Instagram.like_media(photo.id)
      puts "completed liking #{photo.id}"
    rescue Exception => e  
      error_count = error_count + 1
      puts e.message 
      if error_count >= 2   
        puts 'Error! Retry has failed, waiting 10 min'
        sleep 600
      end 
    end
  end
end 
