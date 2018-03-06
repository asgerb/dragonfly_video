require 'dragonfly'
require 'dragonfly_video/plugin'
require 'dragonfly_video/version'

Dragonfly.app.configure do
  plugin :video
end
