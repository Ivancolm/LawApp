class SolutionSerializer < ActiveModel::Serializer
  attributes :id
  has_one :answer
  has_one :question
end
