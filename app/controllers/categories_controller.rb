class CategoriesController < ApplicationController
    skip_before_action :authorized

    def index
        @categories = []
        current_user.questions.each do |question|
            @categories << question.category
        end 

        render json: @categories.uniq
    end 
end
