require "redmine_pdci"
require "redmine_pdci/version"

Redmine::Plugin.register :redmine_pdci do
  menu :project_menu, :tb_polls, {controller: "tb_polls", action: "index" }, caption: :label_tb_poll_plural, param: :project_id
  project_module :tb_polls do
    permission :view_tb_polls, tb_polls: [:index, :show]
    permission :manage_tb_polls, tb_polls: [:new, :create, :edit, :update, :destroy]
    # adicionado a action para permissao
    permission :vote_polls, polls: [:vote]
    
  end
  name "Redmine Pdci"
  author "GitLab"
  description "Redmine Pdci"
  version RedminePdci::VERSION
  url ""
  author_url ""
  requires_redmine version_or_higher: "2.3.4"
  settings partial: "redmine_pdci", default: {}
end