# config/initializers/google_authenticator_rails.rb

# The cookie normally expires in 24 hours, you can change this to 1 month
GoogleAuthenticatorRails.time_until_expiration = 1.month

# You can override the suffix of the cookie's key, by default this is mfa_credentials
GoogleAuthenticatorRails.cookie_key_suffix = 'mfa_credentials'

# Rails offers a few more cookie options, by default only :httponly is turned on, you can change it to HTTPS only:
GoogleAuthenticatorRails.cookie_options = { :httponly => true, :secure => true, :domain => :all }