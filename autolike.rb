#!/Users/cjbordeleau/.rvm/rubies/ruby-1.9.3-p125/bin/ruby

require 'rubygems'
require 'instagram'

# configure insagram gem
Instagram.configure do |config|
  config.access_token = "2527616.fbc822f.4b471989b255461cbf2af9701913ade2"
  config.client_id = "2584bf66a2ba45009327a375182f91fc"
end

# define tags
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
  
  #get 60 most recent photos with tag
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
