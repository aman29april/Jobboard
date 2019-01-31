require 'ostruct'

class DataPresentor

  ATTRS = %w[Company
             JobTitle
             DID
             ApplyURL
             DescriptionTeaser
             EmploymentType
             JobDetailsURL
             City
             State
             PostedTime
             PostedDate
             Pay
             CompanyImageURL
             JobDescription
             JobLevel].freeze


  def self.jobs(results)
    results.each_with_object([]) { |item, res| res << to_obj(item) }
  end

  def self.to_obj(job_posting)
    post = Posting.new(job_posting)
    data = ATTRS.each_with_object({}) { |k, res| res[k.underscore] = post.get(k) }
    OpenStruct.new(data)
  end
end

class Posting
  def initialize(posting)
    @posting = posting
  end

  def get(key)
    @posting.at_xpath(key).try(:text)
  end
end
