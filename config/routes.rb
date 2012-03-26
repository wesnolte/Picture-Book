PictureBook::Application.routes.draw do
  get "scraper/images_for_url"

  get "tiles/view"
end
