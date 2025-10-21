class SessaoController < ApplicationController
  layout 'login'  
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :autorizar_usuario
  
  def new
    if usuario_atual
      redirect_to painel_path
    end
  end
  
  def create
    usuario = Usuario.find_by(email: params[:email])
    
    if usuario && usuario.password_digest == params[:password]
      session[:usuario_id] = usuario.id
      redirect_to painel_path, notice: "Login realizado com sucesso!"
    else
      flash[:alert] = "Email ou senha inválidos"
      redirect_to login_path
    end
  end
  
  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
  
  private
  
  def usuario_atual
    @usuario_atual ||= Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :usuario_atual
end