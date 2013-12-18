require 'spec_helper'

describe "welcome/index" do
  before(:each) do
    visit("/")
  end
  context "no user logged in" do
    it "redirects to the log in page" do
      expect(current_path).to eq("/login")
    end
    it "offers a log in form" do
      expect(page).to have_field("email")
      expect(page).to have_field("password")
      expect(page).to have_button("Log In")
    end
    describe "user must sign up" do
      it "offers a sign up link" do
        expect(page).to have_link("Sign Up")
      end
      it "takes you to the sign up page" do
        click_link "Sign Up"
        expect(page).to have_field("user_name")
        expect(page).to have_field("user_email")
        expect(page).to have_field("user_password")
        expect(page).to have_field("user_password_confirmation")
        expect(current_path).to eq("/users/new")
      end
    end
    it "doesn't offer a dash link" do
      expect(page).to have_no_link("Dash")
    end
    context "when user logs in" do
      it "authenticates the user and redirects to their dash" do
        u1 = User.create({name: "Enoch", email: "enoch@enoch.com", password: "pass", password_confirmation: "pass"})
        fill_in "email", with: u1.email
        fill_in "password", with: u1.password
        click_button "Log In"
        expect(page).to have_content(u1.name)
        expect(current_path).to eq("/users/#{u1.id}")
      end
    end
  end
  context "when there is a logged in user" do
    before do
      @u1 = User.create({name: "Enoch", email: "enoch@enoch.com", password: "pass", password_confirmation: "pass"})
      fill_in "email", with: @u1.email
      fill_in "password", with: @u1.password
      click_button "Log In"
      visit "/"
    end
    it "redirects to the dash" do
      expect(page).to have_content(@u1.name)
      expect(current_path).to eq("/users/#{@u1.id}")
    end
    it "has a log out link" do
      expect(page).to have_link("Log Out")
    end
    it "log out link logs user out" do
      click_link("Log Out")
      expect(current_path).to eq("/login")
      expect(page).to have_no_link("Dash")
    end
  end
end

