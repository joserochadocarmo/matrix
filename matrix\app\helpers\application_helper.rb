module ApplicationHelper
	include RailsAdmin::ApplicationHelper

	def matrix_crud(case_id,tabela_id)
		Matrix.where(:case_id => case_id, :tabela_id => tabela_id).first
  	end

end
