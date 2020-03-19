class WorkReportTemplate < ActiveRecord::Base
    belongs_to :project
    belongs_to :work_report_type
end
