require 'test_helper'

class PlacesControllerTest < ActionController::TestCase

 test "create" do
    user = FactoryGirl.create(:user)
    sign_in user
 
    assert_difference 'Place.count' do
      post :create, {:place => {
          :name => 'yolo',
          :description => 'omg',
          :latitude => 42.3631519,
          :longitude => -71.056098
        }
      }
    end
    
  end
end
