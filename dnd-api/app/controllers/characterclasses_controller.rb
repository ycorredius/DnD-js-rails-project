class CharacterclassesController < ApplicationController
    def index
        classes = Characterclass.all
        render json: classes
    end
end
