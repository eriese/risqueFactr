require 'spec_helper'

describe UsersController do
  let(:user){
    User.create({name: "Enoch", email: "enoch@enoch.com", password: "pass", password_confirmation: "pass"})
  }
  let(:valid_session) {
    {:user_id => user.id}
  }
  describe "GET index" do
    it "checks for a valid session" do
      get :index
      response.should redirect_to("/login")
    end
    it "sends a logged in user to their dash" do
      get :index, {}, valid_session
      response.should redirect_to(user)
    end
  end
  describe "GET new" do
    it "assigns a dummy user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end
end
