require 'test_helper'

class TbPollsControllerTest < ActionController::TestCase
  setup do
    @tb_poll = tb_polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tb_polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tb_poll" do
    assert_difference('TbPoll.count') do
      post :create, tb_poll: { no: @tb_poll.no, question: @tb_poll.question, yes: @tb_poll.yes }
    end

    assert_redirected_to tb_poll_path(assigns(:tb_poll))
  end

  test "should show tb_poll" do
    get :show, id: @tb_poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tb_poll
    assert_response :success
  end

  test "should update tb_poll" do
    put :update, id: @tb_poll, tb_poll: { no: @tb_poll.no, question: @tb_poll.question, yes: @tb_poll.yes }
    assert_redirected_to tb_poll_path(assigns(:tb_poll))
  end

  test "should destroy tb_poll" do
    assert_difference('TbPoll.count', -1) do
      delete :destroy, id: @tb_poll
    end

    assert_redirected_to tb_polls_path
  end
end
