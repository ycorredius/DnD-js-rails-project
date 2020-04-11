class RacesController < ApplicationController
    def index
        @races = Race.all
        render json: @races
    end
end
