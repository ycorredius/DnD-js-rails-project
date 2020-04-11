class CharactersController < ApplicationController
    before_action :set_characterclass, only: [:show]

    def index
        @classes = Characterclass.all
        render json: @classes 
    end

    
end
