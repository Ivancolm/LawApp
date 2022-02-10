class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :admin

    has_many :questions
end
