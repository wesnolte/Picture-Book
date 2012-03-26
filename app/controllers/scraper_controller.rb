class ScraperController < ApplicationController


  def images_for_url
    url = params[:url]
    puts 'scraper url: ' + url
    
    agent = Mechanize.new
    page = agent.get(url) 
    
    @images = [] 
    biggest_img = ''
    largest_dimension = 0 
    
    page.image_urls.compact.each do |img_url|
      img = img_url.to_s
      
      if img.nil? then
        next
      end
      
      if !img.include? 's.ytimg.com' then
        ds = FastImage.size(img)
        puts 'ds: ' + ds.inspect
        w = ds[0]
        h = ds[1]
        if w >= 50 && h >= 50 then
          if (w + h) > largest_dimension then
            largest_dimension = w + h
            biggest_img = img
          end
        end
      end
    end
    
    @images << biggest_img
    
    respond_to do |format|
      format.html { render :json => @images }
      format.xml { render :xml => @images }
      format.json { render :json => @images }
    end
  end

end
