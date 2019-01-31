class JobSearch

  def initialize(attribs = {})
    @base_url = 'api.careerbuilder.com'
    @key =      'WDH710868WY0DWW72J34'
    @attribs =  attribs
  end

  # search jobs
  def search
    root = RemoteData.fetch(jobsearch_url)
    root.xpath('Results/JobSearchResult')
  end

  # fetch job posting by its DID
  def find(did)
    root = RemoteData.fetch(get_job_url(did))
    root.xpath('Job')
  end

  private

  # parmas used while fetching a particular posting
  def get_qry(did)
    { DID: did }.merge(default_params).to_query
  end

  # parms used while searching job posting
  def search_qry
    {
      location: @attribs[:loc],
      keywords: @attribs[:q]
    }.merge(default_params).compact.to_query
  end

  # defaut param to pass with api calls
  def default_params
    { DeveloperKey: @key }
  end

  # returns job fetch URI
  def get_job_url(did)
    URI::HTTP.build(host: @base_url, path: '/v1/job', query: get_qry(did))
  end

  # job search URI
  def jobsearch_url
    URI::HTTP.build(host: @base_url, path: '/v1/jobsearch', query: search_qry)
  end

end
