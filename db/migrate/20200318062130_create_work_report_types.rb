class CreateWorkReportTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :work_report_types do |t|
      t.string :name
      t.text :description
      t.boolean :enabled

    end
  end
end
