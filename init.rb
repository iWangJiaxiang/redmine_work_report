Redmine::Plugin.register :redmine_work_report do
  name 'Redmine Work Report'
  author 'Wang Jiaxiang <mail@wjx.me>'
  description 'This is a plugin for Redmine, which allow users to write work reports for each projects periodically.'
  version '0.0.1'
  url 'https://github.com/iWangJiaxiang/redmine_work_report'
  author_url 'http://example.com/about'

  requires_redmine version_or_higher: '4.0'

  project_module :work_report do
    permission :view_work_report, :work_report => :index
  end

  # menu :account_menu, :work_report, { :controller => 'work_report', :action => 'index', "project_id": nil}, :caption => :menu_title, :param => :project_id
  menu :top_menu, :work_report, { :controller => 'global_work_report', :action => 'index', "project_id": nil}, :caption => :menu_title, :param => :project_id
  menu :admin_menu, :work_report, { controller: 'global_work_report_type', action: 'index', "project_id": nil}, caption: :menu_title, :param => :project_id
  menu :project_menu, :work_report, { :controller => 'work_report', :action => 'index'}, :caption => :menu_title, :param => :project_id, :before => :documents, :require => :member
  # menu :project_menu, :work_report, { :controller => 'work_report', :action => 'show', "project_id": nil}, :caption => :menu_title, :param => :project_id, :before => :documents


  permission :enable_work_report, :work_report => :show
  permission :view_work_report, :work_report => :show
  permission :delete_work_report, :work_report => :delete
  permission :create_work_report, :work_report => :create
  permission :update_work_report, :work_report => :update
  permission :update_others_work_report, :work_report => :update

  permission :enable_work_report_type, :work_report_type => :show
  permission :view_work_report_type, :work_report_type => :show
  permission :delete_work_report_type, :work_report_type => :delete
  permission :create_work_report_type, :work_report_type => :create
  permission :update_work_report_type, :work_report_type => :update
  permission :update_others_work_report_type, :work_report_type => :update

  permission :enable_global_work_report, :global_work_report => :show
  permission :view_global_work_report, :global_work_report => :show
  permission :delete_global_work_report, :global_work_report => :delete
  permission :create_global_work_report, :global_work_report => :create
  permission :update_global_work_report, :global_work_report => :update
  permission :update_others_global_work_report, :global_work_report => :update

  permission :enable_global_work_report_type, :global_work_report_type => :show
  permission :view_global_work_report_type, :global_work_report_type => :show
  permission :delete_global_work_report_type, :global_work_report_type => :delete
  permission :create_global_work_report_type, :global_work_report_type => :create
  permission :update_global_work_report_type, :global_work_report_type => :update
  permission :update_others_global_work_report_type, :global_work_report_type => :update



end
