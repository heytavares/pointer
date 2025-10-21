class ItensEstoqueController < ApplicationController
  before_action :autorizar_usuario
  before_action :requerir_admin # Apenas admin pode gerenciar estoque
  
  # ... resto do código ...
end

  # GET /item_estoques or /item_estoques.json
  def index
    @item_estoques = ItemEstoque.all
  end

  # GET /item_estoques/1 or /item_estoques/1.json
  def show
  end

  # GET /item_estoques/new
  def new
    @item_estoque = ItemEstoque.new
  end

  # GET /item_estoques/1/edit
  def edit
  end

  # POST /item_estoques or /item_estoques.json
  def create
    @item_estoque = ItemEstoque.new(item_estoque_params)

    respond_to do |format|
      if @item_estoque.save
        format.html { redirect_to @item_estoque, notice: "Item estoque was successfully created." }
        format.json { render :show, status: :created, location: @item_estoque }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_estoques/1 or /item_estoques/1.json
  def update
    respond_to do |format|
      if @item_estoque.update(item_estoque_params)
        format.html { redirect_to @item_estoque, notice: "Item estoque was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @item_estoque }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_estoques/1 or /item_estoques/1.json
  def destroy
    @item_estoque.destroy!

    respond_to do |format|
      format.html { redirect_to item_estoques_path, notice: "Item estoque was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_estoque
      @item_estoque = ItemEstoque.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_estoque_params
      params.expect(item_estoque: [ :nome, :categoria, :quantidade, :estoque_minimo, :preco_unitario, :localizacao ])
    end
end
