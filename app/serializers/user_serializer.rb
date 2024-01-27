class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attribute :name do |user|
    user.name && user.name
  end
end
