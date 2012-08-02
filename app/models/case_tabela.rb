# coding: utf-8
class CaseTabela < ActiveRecord::Base
  attr_accessible :case_id, :crud, :tabela_id, :lock_version

  belongs_to :case
  belongs_to :tabela

  validates_length_of :crud, :maximum => 5, :allow_blank => true       
  validate :caracteres_validos?

  before_save :maisculo

  protected 

  def maisculo
  	self.crud=self.crud.upcase unless self.crud.blank?
  end

  def caracteres_validos?
    unless self.crud.blank?
      crud_valido= self.maisculo.match('[^C|^R|^U|^D]')
      errors.add(:ERROR,": Somente os caracteres C-R-U-D são válidos.") unless crud_valido.blank?
    end
  end

end
