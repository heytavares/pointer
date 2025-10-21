class ChamadosController < ApplicationController
  before_action :set_chamado, only: [:show, :edit, :update, :destroy]

  # GET /chamados or /chamados.json
  def index
    @chamados = Chamado.includes(:funcionario).all.order(created_at: :desc)
  end

  # GET /chamados/gerenciar - Aba de Gerenciamento Avançado
  def gerenciar
    @chamados = Chamado.includes(:funcionario).all.order(created_at: :desc)
    
    # Aplicar filtros
    @chamados = @chamados.where(status: params[:status]) if params[:status].present?
    @chamados = @chamados.where(prioridade: params[:prioridade]) if params[:prioridade].present?
    @chamados = @chamados.where(categoria: params[:categoria]) if params[:categoria].present?
    
    if params[:search].present?
      @chamados = @chamados.where("titulo ILIKE ? OR descricao ILIKE ?", 
                                 "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  # GET /chamados/1 or /chamados/1.json
  def show
  end

  # GET /chamados/new
  def new
    @chamado = Chamado.new
  end

  # GET /chamados/1/edit
  def edit
  end

  # POST /chamados or /chamados.json
  def create
    @chamado = Chamado.new(chamado_params)

    respond_to do |format|
      if @chamado.save
        format.html { redirect_to @chamado, notice: "Chamado criado com sucesso." }
        format.json { render :show, status: :created, location: @chamado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chamados/1 or /chamados/1.json
  def update
    respond_to do |format|
      if @chamado.update(chamado_params)
        format.html { redirect_to @chamado, notice: "Chamado atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @chamado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1 or /chamados/1.json
  def destroy
    @chamado.destroy!

    respond_to do |format|
      format.html { redirect_to chamados_path, notice: "Chamado excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_chamado
    @chamado = Chamado.find(params[:id])
  end

  def chamado_params
    params.require(:chamado).permit(:titulo, :descricao, :funcionario_id, :categoria, :prioridade, :status, :data_vencimento)
  end
end