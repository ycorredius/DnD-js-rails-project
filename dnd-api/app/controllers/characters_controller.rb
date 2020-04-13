class CharactersController < ApplicationController
    before_action :set_characterclass, only: [:show]

    def index
        @classes = Character.all
        render json: @classes 
    end

    def create
        binding.pry
        @character = Character.new(name: params[:name], characterclass_id: params[:characterclass_id])
        if @character.save
            render json: @character
        end
    end
    
    private

    def character_params
    end
end
