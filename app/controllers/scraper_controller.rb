class ScraperController < ApplicationController


  def images_for_url
    url = params[:url]
    puts 'scraper url: ' + url
    
    agent = Mechanize.new
    page = agent.get(url) 
    
    @images = []  
    
    page.image_urls.each do |img_url|
      img = img_url.to_s
      
      if img.nil? then
        next
      end
      
      if !img.include? 's.ytimg.com' then
        @images << img
        puts img
      end
    end
    
    respond_to do |format|
      format.html { render :json => @images }
      format.xml { render :xml => @images }
      format.json { render :json => @images }
    end
  end

end
