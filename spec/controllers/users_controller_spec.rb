require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # describe "GET 'users/sign_in'" do

  #   it "should be successful" do
  #     get :sign_in, :id => @user.id
  #     response.should be_success
  #   end

  #   it "should find the right user" do
  #     get :show, :id => @user.id
  #     assigns(:user).should == @user
  #   end

  # end
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy

  it { should route(:post, '/users').to('devise/registrations#create') }
  it { should route(:get, "/users/sign_in").to("devise/sessions#new") }
  it { should route(:post, "/users/sign_in").to("devise/sessions#create") }

  it { should route(:post, "/users/password").to("devise/passwords#create")}
  it { should route(:get, "/users/password/new").to("devise/passwords#new")}
  it { should route(:get, "/users/password/edit").to("devise/passwords#edit")}

  it { should route(:get, "/users/cancel").to("devise/registrations#cancel")}

  it { should route(:post, "/users").to("devise/registrations#create")}
  it { should route(:get,  "/users/sign_up").to("devise/registrations#new")}
  it { should route(:get,  "/users/edit").to("devise/registrations#edit")}

end