# IMPORTANT: See https://github.com/streamio/streamio-ffmpeg
# require 'streamio-ffmpeg'
require_relative "base_processor"

module DragonflyVideo
  module Processors
    class Optimize < BaseProcessor
      def call(content, options = {})
        raise "optimize only supports mp4" unless content.ext == "mp4"
        content.shell_update do |old_path, new_path|
          "#{FFMPEG_COMMAND} -i #{old_path} -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 -y #{new_path}"
        end
      end
    end
  end
end
