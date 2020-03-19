# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'work_report/overview' , :to => 'work_report#list'
get 'work_report/create' , :to => 'work_report#create'
# get 'work_report/delete' , :to => 'work_report#delete'
# get 'work_report/update' , :to => 'work_report#update'


resources :projects do
  resources :work_report, :controller => "work_report"
  resources :work_report_type, :controller => "work_report_type"
end

# scope 'work_report', as: 'global', :controller => "global_work_report_type" do
#   get "report_type", :to => 'show', defaults: { test_param: 'testest' }
# end

scope 'work_report' do
  # resources :global_work_report_type do
  get 'type' , :to => 'global_work_report_type#show'
  # end
end

# get 'work_report/type' , :to => 'global_work_report_type#show'

# get "work_report/type", :to => 'global_work_report_type#show'
