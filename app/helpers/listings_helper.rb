module ListingsHelper
    def image_select(listing)  
        return listing.picture if listing.picture.attached?
        #if no picture attached use default pic
        return "/assets/default_image.jpg"
    end
end
