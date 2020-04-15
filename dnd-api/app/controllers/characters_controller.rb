class CharactersController < ApplicationController
    before_action :set_characterclass, only: [:show]

    def index
        @classes = Character.all
        render json: @classes 
    end

    def create
        @character = Character.new(name: params[:name], characterclass_id: params[:characterclass_id],race_id: params[:race_id])
        if @character.save
            render json: @character
        end
    end

    private
    def set_characterclass
        @characterclass = Characterclass.find_by(id: params[:id])
    end
end
