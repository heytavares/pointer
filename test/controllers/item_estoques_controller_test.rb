require "test_helper"

class ItemEstoquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_estoque = item_estoques(:one)
  end

  test "should get index" do
    get item_estoques_url
    assert_response :success
  end

  test "should get new" do
    get new_item_estoque_url
    assert_response :success
  end

  test "should create item_estoque" do
    assert_difference("ItemEstoque.count") do
      post item_estoques_url, params: { item_estoque: { categoria: @item_estoque.categoria, estoque_minimo: @item_estoque.estoque_minimo, localizacao: @item_estoque.localizacao, nome: @item_estoque.nome, preco_unitario: @item_estoque.preco_unitario, quantidade: @item_estoque.quantidade } }
    end

    assert_redirected_to item_estoque_url(ItemEstoque.last)
  end

  test "should show item_estoque" do
    get item_estoque_url(@item_estoque)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_estoque_url(@item_estoque)
    assert_response :success
  end

  test "should update item_estoque" do
    patch item_estoque_url(@item_estoque), params: { item_estoque: { categoria: @item_estoque.categoria, estoque_minimo: @item_estoque.estoque_minimo, localizacao: @item_estoque.localizacao, nome: @item_estoque.nome, preco_unitario: @item_estoque.preco_unitario, quantidade: @item_estoque.quantidade } }
    assert_redirected_to item_estoque_url(@item_estoque)
  end

  test "should destroy item_estoque" do
    assert_difference("ItemEstoque.count", -1) do
      delete item_estoque_url(@item_estoque)
    end

    assert_redirected_to item_estoques_url
  end
end
