namespace :report do
  desc "This will send out an email once a month with an HTML report"
  task :montly_report => :environment do
    ReportMailer.monthly_report
  end

  desc "This will send out an email once every 6 months with a more extensive HTML report"
  task :bi_annual_report => :environment do
    ReportMailer.bi_annual_report
  end
end
