class CreateWorkReportTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :work_report_templates do |t|
      t.string :name
      t.text :content
      t.boolean :enabled
      t.belongs_to :project
      t.belongs_to :work_report_type
    end
  end
end
