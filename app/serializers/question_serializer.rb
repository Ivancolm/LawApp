class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :inquire, :date, 
    belongs_to :user
end
