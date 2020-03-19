class WorkReport < ActiveRecord::Base
    validates_associated :work_report_type
    # validates :work_report_type, presence: true
    belongs_to :work_report_type

    belongs_to :user
    belongs_to :project
end
