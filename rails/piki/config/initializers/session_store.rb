# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_piki_session',
  :secret      => '5aeb63fca6bc22c8b5d345e5b854e078a6d45988374334876d028cefe5dbcc00aff9aeabbe16758889dbc59c16bad582a82afd1e9b3c149d979a369b4b4afcc1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
