class QuestionsController < ApplicationController
    def index
        @questions = current_user.questions

        render json: @questions
    end 

    def create 
        if params[:category] != ''
            @category = Category.find_or_create_by(legal_field: params[:category])
        
            @questions = Questions.create(text: params[:inquire], category_id: @category.id, user_id: current_user.id)

            render json: { questions: questionsSerializer.new(@question), category: CategorySerializer.new(@category) }, status: :created  
        else 
            render json: { error: 'Failed to create question.'}, status: :not_acceptable
        end 
    end 

    def show 
        @question = questions.find_by(id: params[:id])
        @category = @questions.category

        if @questions
            render json: { questions: questionsSerializer.new(@questions), category: CategorySerializer.new(@category) }
        else
            render json: { error: 'questions not found.' }
        end 
    end 
end
