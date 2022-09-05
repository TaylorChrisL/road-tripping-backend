require "pusher"

Pusher.app_id = "1473510"
Pusher.key = Rails.application.credentials.pusher_key
Pusher.secret = Rails.application.credentials.pusher_secret
Pusher.cluster = "us3"
Pusher.logger = Rails.logger
Pusher.encrypted = true
