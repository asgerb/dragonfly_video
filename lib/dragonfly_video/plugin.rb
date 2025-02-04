require "dragonfly_video/analysers/video_properties"
require "dragonfly_video/processors/screenshot"
require "dragonfly_video/processors/remove_audio"
require "dragonfly_video/processors/optimize"

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

    app.add_processor :screenshot, DragonflyVideo::Processors::Screenshot.new
    app.add_processor :remove_audio, DragonflyVideo::Processors::RemoveAudio.new
    app.add_processor :optimize, DragonflyVideo::Processors::Optimize.new
  end
end

Dragonfly::App.register_plugin(:video) { DragonflyVideo::Plugin.new }
