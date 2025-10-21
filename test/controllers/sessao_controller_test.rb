require "test_helper"

class SessaoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessao_new_url
    assert_response :success
  end

  test "should get create" do
    get sessao_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessao_destroy_url
    assert_response :success
  end
end
