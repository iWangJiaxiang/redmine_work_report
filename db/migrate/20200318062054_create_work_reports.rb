class CreateWorkReports < ActiveRecord::Migration[5.2]
  def change
    create_table :work_reports do |t|
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :work_report_type
      t.belongs_to :user
      t.belongs_to :project
    end
  end
end
