require 'streamio-ffmpeg'

# IMPORTANT: See https://github.com/streamio/streamio-ffmpeg

module DragonflyVideo
  module Processors
    class Screenshot
      FFMPEG_COMMAND = 'ffmpeg'.freeze

      def call(content, options = {})
        format = options.delete(:format) { :jpg }

        content.shell_update(ext: format) do |old_path, new_path|
          "#{FFMPEG_COMMAND} -y -i #{old_path} -vframes 1 #{new_path}"
        end

        content.ext = format
        content
      end

      def update_url(attrs, options = {})
        format = options.fetch(:format, :jpg)
        attrs.ext = format.to_s
      end
    end
  end
end
