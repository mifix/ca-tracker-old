require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Statistic.first
    assert_template 'show'
  end
end
