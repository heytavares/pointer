require "test_helper"

class ChamadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chamado = chamados(:one)
  end

  test "should get index" do
    get chamados_url
    assert_response :success
  end

  test "should get new" do
    get new_chamado_url
    assert_response :success
  end

  test "should create chamado" do
    assert_difference("Chamado.count") do
      post chamados_url, params: { chamado: { categoria: @chamado.categoria, data_vencimento: @chamado.data_vencimento, descricao: @chamado.descricao, funcionario_id: @chamado.funcionario_id, prioridade: @chamado.prioridade, status: @chamado.status, titulo: @chamado.titulo } }
    end

    assert_redirected_to chamado_url(Chamado.last)
  end

  test "should show chamado" do
    get chamado_url(@chamado)
    assert_response :success
  end

  test "should get edit" do
    get edit_chamado_url(@chamado)
    assert_response :success
  end

  test "should update chamado" do
    patch chamado_url(@chamado), params: { chamado: { categoria: @chamado.categoria, data_vencimento: @chamado.data_vencimento, descricao: @chamado.descricao, funcionario_id: @chamado.funcionario_id, prioridade: @chamado.prioridade, status: @chamado.status, titulo: @chamado.titulo } }
    assert_redirected_to chamado_url(@chamado)
  end

  test "should destroy chamado" do
    assert_difference("Chamado.count", -1) do
      delete chamado_url(@chamado)
    end

    assert_redirected_to chamados_url
  end
end
