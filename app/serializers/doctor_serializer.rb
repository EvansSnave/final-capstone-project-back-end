class DoctorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :avatar_url
end
