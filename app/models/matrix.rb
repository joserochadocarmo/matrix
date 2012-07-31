class Matrix < ActiveRecord::Base
  attr_accessible :case_id, :crud, :tabela_id, :lock_version

  belongs_to :case
  belongs_to :tabela

  validates_length_of :crud, :maximum => 4, :allow_blank => true       
  #validates_format_of :crud, :with =>  /^[CRUD]*$/, :allow_blank => true

  before_save :maisculo

  protected 

  def maisculo
  	self.crud=self.crud.upcase unless self.crud.blank?
  end

end
