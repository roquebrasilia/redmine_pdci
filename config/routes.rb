# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do

  scope "/projects/:project_id" do
    resources :tb_polls
  end

end