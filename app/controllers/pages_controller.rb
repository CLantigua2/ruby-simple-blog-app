class PagesController < ApplicationController
    def about
        # this sets variables that will be used in the view
        @title = 'About Us'
        @content = "This is the about page"
    end
end
