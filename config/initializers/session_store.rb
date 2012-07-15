# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_barcampnola5_session',
  :secret      => 'd857ee674976b103fa93668fef3198fd97763b234d577bad7b26b557e01a4c582f1de982d19da51602d9433eb160bb87a469fb3206adb38eb4607d22c3eaf960'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
