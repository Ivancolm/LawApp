class QuestionCategorySerializer < ActiveModel::Serializer
  attributes :id
  has_one :question
  has_one :category
end
