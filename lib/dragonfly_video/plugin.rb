require 'dragonfly_video/analysers/video_properties'

class DragonflyVideo::Plugin
  def call(app, _opts = {})
    app.add_analyser :video_properties, DragonflyVideo::Analysers::VideoProperties.new

    [
      DragonflyVideo::Analysers::VideoProperties::VIDEO_PROPS
    ].flatten.each do |analyser|
      app.add_analyser analyser do |content|
        content.analyse(:video_properties)[analyser]
      end
    end
  end
end

Dragonfly::App.register_plugin(:video) { DragonflyVideo::Plugin.new }
