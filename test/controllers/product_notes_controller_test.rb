require 'test_helper'

class ProductNotesControllerTest < ActionController::TestCase
  setup do
    @product_note = product_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_note" do
    assert_difference('ProductNote.count') do
      post :create, product_note: { note: @product_note.note, product_id: @product_note.product_id }
    end

    assert_redirected_to product_note_path(assigns(:product_note))
  end

  test "should show product_note" do
    get :show, id: @product_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_note
    assert_response :success
  end

  test "should update product_note" do
    patch :update, id: @product_note, product_note: { note: @product_note.note, product_id: @product_note.product_id }
    assert_redirected_to product_note_path(assigns(:product_note))
  end

  test "should destroy product_note" do
    assert_difference('ProductNote.count', -1) do
      delete :destroy, id: @product_note
    end

    assert_redirected_to product_notes_path
  end
end
