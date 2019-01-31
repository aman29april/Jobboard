module ApplicationHelper

  # unescape description html
  def format_desc(text)
    CGI.unescapeHTML(text.to_s).html_safe
  end

  # show job path
  def job_path(posting)
    "/jdp/#{posting.did}"
  end
end
