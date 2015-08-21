require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
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
    assert_redirected_to places_path
 
    assert_equal 1, user.places.count
  end
end


