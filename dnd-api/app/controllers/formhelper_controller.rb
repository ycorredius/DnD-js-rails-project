class FormhelperController < ApplicationController
    def index
        @race = Race.all
        @characterclass = Characterclass.all
    end
end
