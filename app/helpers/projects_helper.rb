require 'matrix'
module ProjectsHelper
	def matrix_crud(case_id,tabela_id)
		CaseTabela.where(:case_id => case_id, :tabela_id => tabela_id).first
  	end
end
