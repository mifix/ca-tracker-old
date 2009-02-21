require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Player.first
    assert_template 'show'
  end
end
