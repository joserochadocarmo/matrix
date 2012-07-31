# coding: utf-8

require 'dragonfly/rails/images'

RailsAdmin.config do |config|
  config.main_app_name =  ["Matrix", "beta"]
  config.authenticate_with do
    authenticate_user!
  end
  config.current_user_method { current_user } # auto-generated
  config.authorize_with :cancan
  config.audit_with :history, User
  config.default_items_per_page = 25

  #config.excluded_models << "ClassName"
  #config.included_models = ["Class1", "Class2", "Class3"]
  #config.excluded_models = ["Matrix"]

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    #export
    #history_index
    #bulk_delete
    # member actions
    show
    edit
    delete
    #history_show
    show_in_app
  end

  config.models do
    fields_of_type :datetime do
      strftime_format "%d/%m/%Y %H:%M:%S"
    end
    fields_of_type :date do
      strftime_format "%d/%m/%Y"
    end
  end

  config.model Project do
    label "Projeto"
    label_plural "Projetos"  
    weight -1

    list do
      sort_by :name
      field :id
      field :name do
        label "Nome"
        pretty_value do
          href = bindings[:view].rails_admin.show_path("Project",bindings[:object])
          bindings[:view].link_to(value, href)
        end
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :created_at do
        label "Criado em"
      end
      field :updated_at do
        label "Alterado em"
      end
      field :cases do
        label "Funcionalidades"
      end
      field :tabelas do
        label "Entidades"
      end
    end

    edit do
      field :name do
        label "Nome"
      end
      field :active do
        label "Ativo?"
      end
      field :cases do
        label "Funcionalidades"
      end
      field :tabelas do
        label "Entidades"
      end
      field :lock_version, :hidden do
        visible true
      end

    end

    show do
      field :name do
        label "Nome"
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :cases do
        label "Funcionalidades"
      end
      field :tabelas do
        label "Entidades"
      end
    end
  end

  config.model Case do
    label "Funcionalidade"
    label_plural "Funcionalidades"  

    list do
      sort_by :filter

      field :id
      field :name do
        label "Nome"
        column_width 300
        pretty_value do
          href = bindings[:view].rails_admin.show_path("Case",bindings[:object])
          bindings[:view].link_to(value, href)
        end
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :project do
        label "Projeto"
      end
      field :filter do
        label "ID ordenação"
      end
      field :created_at do
        label "Criado em"
      end
      field :updated_at do
        label "Alterado em"
      end
    end

    edit do
      field :name do
        label "Descrição"
      end
      field :active do
        label "Ativo?"
      end
      field :filter do
        label "ID ordenação"
      end
      field :project do
        label "Projeto"
      end
      field :lock_version, :hidden do
        visible true
      end
    end

    show do
      field :name do
        label "Nome"
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :filter do
        label "ID ordenação"
      end
      field :project do
        label "Projeto"
      end
      
    end
  end

  config.model Tabela do
    label "Entidade"
    label_plural "Entidades"  
    weight 1

    list do
      sort_by :filter

      field :id
      field :name do
        label "Nome"
        column_width 160
        pretty_value do
          href = bindings[:view].rails_admin.show_path("Tabela",bindings[:object])
          bindings[:view].link_to(value, href)
        end
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :project do
        label "Projeto"
      end
      field :filter do
        label "ID ordenação"
      end
      field :created_at do
        label "Criado em"
      end
      field :updated_at do
        label "Alterado em"
      end
    end

    edit do
      field :name do
        label "Descrição"
      end
      field :active do
        label "Ativo?"
      end
      field :filter do
        label "ID ordenação"
      end
      field :project do
        label "Projeto"
      end
      field :lock_version, :hidden do
        visible true
      end
    end

    show do
      field :name do
        label "Nome"
      end
      field :active do
        label "Ativo?"
        pretty_value do
          value==false ? "Não" : "Sim" 
        end
      end
      field :filter do
        label "ID ordenação"
      end
      field :project do
        label "Projeto"
      end
    end
  end

end
