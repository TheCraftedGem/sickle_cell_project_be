require 'csv'
require 'aws-sdk-s3'

class ProcessPatientCSV
  def initialize(region, bucket, csv_path)
    s3 = Aws::S3::Resource.net(region: region)
    s3_object = s3.bucket(bucket).object(csv_path)
    @csv = s3_object.get.body
  end

  def add_patient_information
    CSV.parse(@csv, headers: true).each do
      
    end
  end
end