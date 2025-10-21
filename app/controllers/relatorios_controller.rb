class RelatoriosController < ApplicationController
  def index
    # Por enquanto, vamos redirecionar para o painel
    redirect_to painel_path
  end
end