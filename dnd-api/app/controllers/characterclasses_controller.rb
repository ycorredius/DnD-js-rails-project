class CharacterclassesController < ApplicationController
    before_action :set_characterclass, only: [:show]
    def index
        @classes = Characterclass.all
        render json: @classes
    end
    
    def show
        options = {}
        options[:include] = [:proficiencies, :'proficiencies.name', :'proficiencies.category',:'characterclass_proficiencies']
        render json: CharacterclassSerializer.new(@characterclass,options).serialized_json
    end

    private
1
    def set_characterclass
       @characterclass = Characterclass.find(params[:id]) 
    end
end
