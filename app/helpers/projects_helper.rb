#coding: utf-8
module ProjectsHelper
	def matrix_crud(case_id,tabela_id)
		CaseTabela.where(:case_id => case_id, :tabela_id => tabela_id).first
  end

  def existe_create?(crud)
		(crud.to_s.count "C") > 0 ? imagem_sim : imagem_nao
  end

	def nao_existe_create?(crud)
		(crud.to_s.count "C") <= 0 ? 'Então como os dados estão sendo "carregados" ?' : "--"		 
  end

  def existe_read?(crud)
    (crud.to_s.count "R") > 0 ? imagem_sim : imagem_nao
  end

  def nao_existe_read?(crud)
    (crud.to_s.count "R") <= 0 ? 'De onde virão os dados ?' : "--"     
  end

  def existe_delete?(crud)
		(crud.to_s.count "D") > 0 ? imagem_sim : imagem_nao
  end

	def nao_existe_delete?(crud)
		(crud.to_s.count "D") <= 0 ? 'A regra de negócio realmente necessita disso ?' : '--'
  end

  def existe_entidade?(crud)
  		crud.blank? ? imagem_nao : imagem_sim 
  end

	def nao_existe_entidade?(crud)
		crud.blank? ? 'Será que a análise está terminada ?' : '--'
  end
  
  def existe_multiplos?(crud)
    ((crud.to_s.count "C") > 1 || (crud.to_s.count "U") > 1 || (crud.to_s.count "D") > 1  ) ? imagem_sim : imagem_nao
  end

  def nao_existe_multiplos?(crud)
    ((crud.to_s.count "C") > 1 || (crud.to_s.count "U") > 1 || (crud.to_s.count "D") > 1  ) ? 'Prováveis problemas de qualidade nos dados (duplicidade e ambiguidade)?' : '--'
  end

  def imagem_sim
		'<i class="icon-ok"></i> SIM'.html_safe
  end

  def imagem_nao
		'<i class="icon-remove"></i> NÃO'.html_safe 
  end
end
