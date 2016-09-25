require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url: 'lorem.jpg',
      price: 19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select 'table > tr', Product.count
  end

  test "should get new" do
    get new_product_url
    assert_response :success
    assert_select '.field > input', 3
    assert_select '.field > textarea', 1
  end

  test "should create product" do
    products = Product.count
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
    follow_redirect!
    assert_select '#main > p', 5
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
    assert_select '#main > p', 5
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
    assert_select '.field > input', 3
    assert_select '.field > textarea', 1
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
    follow_redirect!
    assert_select '#main > p', 5
  end

  test "should destroy product" do
    products = Product.count
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
    follow_redirect!
    assert_select 'table > tr', products - 1
  end
end
