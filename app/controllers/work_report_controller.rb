class WorkReportController < ApplicationController

  def new
  end

  def create

  end

  def show
    report=WorkReport.create(content: "test report")
    # report.save!
    @test=report
    # type=WorkReportType.create(name: "test type")
    # type.save
    # report=WorkReport.create(content: "test report")
    # report.work_report_type=type
    # report.save!
    @user_id=session[:current_user_id]
    @paramss=params
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    puts "- - - - --666666"
    @project_id=1
    @report=WorkReport.create()
  end
end
