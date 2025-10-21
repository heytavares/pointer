class PainelControleController < ApplicationController
  def index
    # Estatísticas principais
    @total_funcionarios = Funcionario.count
    @chamados_ativos = Chamado.where(status: ['aberto', 'em_andamento']).count
    @total_itens_estoque = ItemEstoque.sum(:quantidade)
    @itens_estoque_baixo = ItemEstoque.where('quantidade <= estoque_minimo').count
    @chamados_atrasados = Chamado.atrasados.count
    @chamados_urgentes = Chamado.where(prioridade: ['alta', 'urgente'], status: ['aberto', 'em_andamento']).count
    
    # Chamados recentes (últimos 6)
    @chamados_recentes = Chamado.includes(:funcionario)
                               .order(created_at: :desc)
                               .limit(6)
  end
end