class PagesController < ApplicationController
    def about
        @content = Page.find_by(url: "about")
    end
    def terms
        @content = Page.find_by(url: "terms")
    end
end
