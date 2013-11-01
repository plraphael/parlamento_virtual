class RealLaw
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ real_id: 1 }, { unique: true })

  field :real_id, type: Integer                         # 527478
  field :name, type: String                             # PL 2718/2011
  field :type, type: String                             # Projeto de Lei
  field :number, type: Integer                          # 2718
  field :year, type: Integer                            # 2011
  field :proposition_date, type: String                 # 16/11/2011 19:40:09
  field :excerpt, type: String                          # ementa
  field :description, type: String                      # explicação ementa
  field :regime, type: String
  field :appraisal, type: String                        # apreciação
  embeds_many :real_authors
  embeds_one :last_expedition, class_name: "Expedition" # despacho
  field :state, type: String                            # situação

  has_one :law
end
