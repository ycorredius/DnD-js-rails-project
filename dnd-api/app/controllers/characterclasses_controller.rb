class CharacterclassesController < ApplicationController
    before_action :set_characterclass, only: [:show]
    def index
        @classes = Characterclass.all
        render json: @classes
    end
    
    def show
        @characterclass = Characterclass.find_by(id: params[:id]) 
        render json: CharacterclassSerializer.new(@characterclass).serialized_json
    end

    private

    def set_characterclass
       @characterclass = Characterclass.find(params[:id]) 
    end
end
