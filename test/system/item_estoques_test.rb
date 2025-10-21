require "application_system_test_case"

class ItemEstoquesTest < ApplicationSystemTestCase
  setup do
    @item_estoque = item_estoques(:one)
  end

  test "visiting the index" do
    visit item_estoques_url
    assert_selector "h1", text: "Item estoques"
  end

  test "should create item estoque" do
    visit item_estoques_url
    click_on "New item estoque"

    fill_in "Categoria", with: @item_estoque.categoria
    fill_in "Estoque minimo", with: @item_estoque.estoque_minimo
    fill_in "Localizacao", with: @item_estoque.localizacao
    fill_in "Nome", with: @item_estoque.nome
    fill_in "Preco unitario", with: @item_estoque.preco_unitario
    fill_in "Quantidade", with: @item_estoque.quantidade
    click_on "Create Item estoque"

    assert_text "Item estoque was successfully created"
    click_on "Back"
  end

  test "should update Item estoque" do
    visit item_estoque_url(@item_estoque)
    click_on "Edit this item estoque", match: :first

    fill_in "Categoria", with: @item_estoque.categoria
    fill_in "Estoque minimo", with: @item_estoque.estoque_minimo
    fill_in "Localizacao", with: @item_estoque.localizacao
    fill_in "Nome", with: @item_estoque.nome
    fill_in "Preco unitario", with: @item_estoque.preco_unitario
    fill_in "Quantidade", with: @item_estoque.quantidade
    click_on "Update Item estoque"

    assert_text "Item estoque was successfully updated"
    click_on "Back"
  end

  test "should destroy Item estoque" do
    visit item_estoque_url(@item_estoque)
    accept_confirm { click_on "Destroy this item estoque", match: :first }

    assert_text "Item estoque was successfully destroyed"
  end
end
