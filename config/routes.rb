# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :projects do
  resources :work_report, :controller => "work_report" do
    get '/', to: 'work_report#index', on: :collection
  end
  resources :work_report_type, :controller => "work_report_type"
end

# scope 'work_report', as: 'global', :controller => "global_work_report_type" do
#   get "report_type", :to => 'show', defaults: { test_param: 'testest' }
# end

scope 'work_report' do
  # resources :global_work_report_type do
  get 'type' , :to => 'global_work_report_type#index'
  get '/' , :to => 'global_work_report#index'
  # end
end
