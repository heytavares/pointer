class ApplicationController < ActionController::Base
  skip_forgery_protection
  
  before_action :autorizar_usuario
  
  private
  
  def usuario_atual
    @usuario_atual ||= Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :usuario_atual
  
  def autorizar_usuario
    # ⭐⭐ PERMITE ACESSO SEM LOGIN PARA CHAMADOS ⭐⭐
    return if controller_name == 'sessao' || controller_name == 'chamados'
    
    unless usuario_atual
      redirect_to login_path, alert: "Por favor, faça login para continuar"
    end
  end
end