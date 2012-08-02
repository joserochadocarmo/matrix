class ProjectsController < ApplicationController
  layout "project"

  before_filter :authenticate_user!, :except => ['show']
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project  = Project.find(params[:id])

    @cases    = @project.cases.ordenado

    @entidades= @project.tabelas.ordenado

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @caseTabela= CaseTabela.find_or_create_by_case_id_and_tabela_id(
      :case_id => params[:case_id], 
      :tabela_id => params[:tabela_id]
    )
    params[:case_tabela][:lock_version] = params[:lock_version]
    
    respond_to do |format|
      if @caseTabela.update_attributes(params[:case_tabela])
        format.html { redirect_to @caseTabela, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caseTabela.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    respond_to do |format|
      h = { :status => "error", :message => "ERROR: Controle de concorrencia <br> 
        Alguem antes de voce ja atualizou esse registro! <br> 
        O Registro que voce tentou salvar era absoleto." }
      format.json { render :json => h, :status => :forbidden }
    end 
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
