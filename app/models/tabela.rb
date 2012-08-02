class Tabela < ActiveRecord::Base
  attr_accessible :active, :name, :filter, :project_id, :lock_version

  belongs_to :project, :inverse_of => :tabelas

  has_many :caseTabela

  validates :name,
            :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => {:maximum => 30}

  validates_presence_of :project

  validates_length_of :filter, :maximum => 3, :allow_blank => true

  scope :ordenado, order(:filter,:id)

end