Rails.application.routes.draw do
  get "sessao/new"
  get "sessao/create"
  get "sessao/destroy"
  root 'sessao#new'
  
  get 'login', to: 'sessao#new'
  post 'login', to: 'sessao#create'
  delete 'logout', to: 'sessao#destroy'
  
  get 'painel', to: 'painel_controle#index'
  resources :funcionarios
  resources :chamados do
    collection do
      get 'gerenciar'
    end
  end
  resources :itens_estoque
end