class TilesController < ApplicationController

  def view
    
    client = Twitter::Client.new
    public_timeline = client.home_timeline(:include_entities => true, :exclude_replies => true)
    status_media = {}
    agent = Mechanize.new
    
    @urls = []
    
    public_timeline.each do |status|
      
      if !status.media.empty? then
        status_media[status.text + '::m'] = status.media
        @urls << status.media[0]
      end
      
      if !status.expanded_urls.empty? then
        
        #ignore youtube
        if !status.expanded_urls[0].include?('youtube') then
          status_media[status.text + '::u'] = status.expanded_urls          
        
          @urls << status.expanded_urls[0]
        end
      end
    end
  
  end

end
