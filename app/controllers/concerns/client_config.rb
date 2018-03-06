module ClientConfig
  extend ActiveSupport::Concern
  
  def display?(par)
    Settings::Client.send("show_#{ par }")
  end

  def service_code
    !@mobile && Settings::Client.service_code
  end

  def login_required?
    Settings::Client.login_required
  end

  def imprint
    Settings::Url.ks_frontend_imprint_url
  end

  def privacy
    Settings::Url.ks_frontend_privacy_url
  end

  def multi_requests_enabled?
    Settings::Client.multi_requests_enabled
  end
end
