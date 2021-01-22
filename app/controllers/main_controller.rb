class MainController < ApplicationController
    def index
        @tournaments = Tournament.all
    end 
end