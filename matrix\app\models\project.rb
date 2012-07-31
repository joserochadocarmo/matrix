class Project < ActiveRecord::Base
  attr_accessible :active, :name, :filter, :cases_attributes, :tabelas_attributes, :lock_version

  validates :name,
            :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => {:maximum => 100}

  validates_length_of :filter, :maximum => 3, :allow_blank => true       
  
  has_many :cases, :dependent => :destroy, :inverse_of => :project
  accepts_nested_attributes_for :cases, :allow_destroy => true   

  has_many :tabelas, :dependent => :destroy, :inverse_of => :project
  accepts_nested_attributes_for :tabelas, :allow_destroy => true   

end
