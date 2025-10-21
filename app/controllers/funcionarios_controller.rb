class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]
  before_action :normalize_status_param, only: [:create, :update]

  def index
    @funcionarios = Funcionario.all
  end

  def show
  end

  def new
    @funcionario = Funcionario.new
  end

  def edit
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionário foi criado com sucesso." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionário foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionário foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def normalize_status_param
      if params[:funcionario] && params[:funcionario][:status]
        params[:funcionario][:status] = params[:funcionario][:status].downcase
      end
    end

    def funcionario_params
      params.require(:funcionario).permit(:nome, :email, :departamento, :cargo, :telefone, :data_admissao, :salario, :status)
    end
end