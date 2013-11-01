class Admin::RealLawSerializer < ActiveModel::Serializer
  attributes :id, :real_id, :name, :type, :number, :year, :proposition_date, :excerpt, :description, :regime, :appraisal, :state
end
