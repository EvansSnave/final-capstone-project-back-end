class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attribute :name, &:name
end
