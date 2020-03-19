def project_menu_allowed?
  proc { |p| User.current.allowed_to?({ controller: 'work_report', action: 'list' }, p) }
end

Redmine::Plugin.register :redmine_work_report do
  name 'Redmine Work Report'
  author 'Wang Jiaxiang <mail@wjx.me>'
  description 'This is a plugin for Redmine, which allow users to write work reports for each projects periodically.'
  version '0.0.1'
  url 'https://github.com/iWangJiaxiang/redmine_work_report'
  author_url 'http://example.com/about'

  requires_redmine version_or_higher: '4.0'

  project_module :work_report do
    permission :enable_work_report, :work_report => :show
    permission :view_work_report, :work_report => :show
  end

  menu :account_menu, :work_report, { :controller => 'work_report', :action => 'list', "project_id": nil}, :caption => :menu_title, :param => :project_id
  # menu :top_menu, :work_report, { :controller => 'work_report', :action => 'list', "project_id": nil}, :caption => :menu_title, :param => :project_id, :before => :documents
  # menu :admin_menu, :work_report, { controller: 'global_work_report_type', action: 'show'}, caption: :menu_title
  menu :project_menu, :work_report, { controller: 'global_work_report_type', action: 'show'}, caption: :menu_title
  # menu :project_menu, :work_report, { :controller => 'work_report', :action => 'lisst', "project_id": nil}, :caption => :menu_title, :param => :project_id, :before => :documents, if: project_menu_allowed?


  permission :enable_work_report, :work_report => :show
  permission :view_work_report, :work_report => :show
  permission :delete_work_report, :work_report => :delete
  permission :create_work_report, :work_report => :create
  permission :update_work_report, :work_report => :update
  permission :update_others_work_report, :work_report => :update
end
