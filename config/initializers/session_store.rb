# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rightaws_paperclip_test_session',
  :secret      => '71e2223e7597726871f1481e4b23f69fb6a03e28e3eee20bb16c02bc27783977745fac47419d29bce87c2f09507175476ae20e1afc14abb2a8215a3b4ba4e7c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
