# Common helper methods.
module ApplicationHelper
  def login_or_logout_link
    if session[:logged_in]
      link_to(t('.log_out'), logout_path)
    else
      link_to t('.log_in'), '/auth/google_oauth2/'
    end
  end
end
