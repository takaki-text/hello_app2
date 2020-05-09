class TopController < ApplicationController
    def index
        @course = Course.all
    end

end

   