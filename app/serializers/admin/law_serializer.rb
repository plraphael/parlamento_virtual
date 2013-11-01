class Admin::LawSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :excerpt, :description, :state
  has_one :real_law
end
