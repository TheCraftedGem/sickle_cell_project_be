Rails.application.configure do
  config.lograge.base_controller_class = ['ActionController::API', 'ActionController::Base']
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.custom_payload do |controller|
    # username = controller.current_user.email if !controller.current_user.nil?
    {
      host: controller.request.host,
      user_ip: controller.request.remote_ip
    }
  end
end