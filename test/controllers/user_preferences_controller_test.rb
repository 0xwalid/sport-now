require 'test_helper'

class UserPreferencesControllerTest < ActionController::TestCase
  setup do
    @user_preference = user_preferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_preference" do
    assert_difference('UserPreference.count') do
      post :create, user_preference: { notes: @user_preference.notes, skill_level: @user_preference.skill_level, sport_id: @user_preference.sport_id, user_id: @user_preference.user_id }
    end

    assert_redirected_to user_preference_path(assigns(:user_preference))
  end

  test "should reject user_preference with too much skill" do
    assert_no_difference('UserPreference.count') do
      @bad_user_preference = user_preferences(:too_skilled)
      post :create, user_preference: { notes: @bad_user_preference.notes, skill_level: @bad_user_preference.skill_level, sport_id: @bad_user_preference.sport_id, user_id: @bad_user_preference.user_id }
    end
  end

  test "should reject user_preference with no skill" do
    assert_not UserPreference.create(skill_level: user_preferences(:no_skills).skill_level).valid?
  end

  test "should show user_preference" do
    get :show, id: @user_preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_preference
    assert_response :success
  end

  test "should update user_preference" do
    patch :update, id: @user_preference, user_preference: { notes: @user_preference.notes, skill_level: @user_preference.skill_level, sport_id: @user_preference.sport_id, user_id: @user_preference.user_id }
    assert_redirected_to user_preference_path(assigns(:user_preference))
  end

  test "should destroy user_preference" do
    assert_difference('UserPreference.count', -1) do
      delete :destroy, id: @user_preference
    end

    assert_redirected_to user_preferences_path
  end
end
