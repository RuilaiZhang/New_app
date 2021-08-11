module ListingsHelper
    def image_select(listing)  
        return listing.picture if listing.picture.attached?
        #if no picture attached use default pic
        return "default_image.jpg"
    end
end
