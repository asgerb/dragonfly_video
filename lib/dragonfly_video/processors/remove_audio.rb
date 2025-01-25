# IMPORTANT: See https://github.com/streamio/streamio-ffmpeg
# require 'streamio-ffmpeg'
require_relative "base_processor"

module DragonflyVideo
  module Processors
    class RemoveAudio < BaseProcessor
      def call(content, options = {})
        content.shell_update do |old_path, new_path|
          "#{FFMPEG_COMMAND} -i #{old_path} -c copy -an #{new_path}"
        end
      end
    end
  end
end
