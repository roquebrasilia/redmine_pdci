require "redmine_pdci"
require "redmine_pdci/version"

Redmine::Plugin.register :redmine_pdci do
  name "Redmine Pdci"
  author "GitLab"
  description "Redmine Pdci"
  version RedminePdci::VERSION
  url ""
  author_url ""
  requires_redmine version_or_higher: "2.3.4"
  settings partial: "redmine_pdci", default: {}
end