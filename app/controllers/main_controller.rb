class MainController < ApplicationController
    def index
        @tournaments = Tournament.all
    end 

    def elements
    end
end