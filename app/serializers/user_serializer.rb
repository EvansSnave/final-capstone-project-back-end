class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :name

  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
  attribute :name do |user|
    user.name && user.name
  end
end
