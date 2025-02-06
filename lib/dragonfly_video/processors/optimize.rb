require_relative "base_processor"

module DragonflyVideo
  module Processors
    class Optimize < BaseProcessor
      def call(content, options = {})
        raise "optimize only supports mp4" unless content.ext == "mp4"

        profile = options.fetch(:profile, :default).to_sym

        case profile
        when :streaming
          crf = 26
          maxrate = "4000k"
          bufsize = "8000k"
          gop = 96
          profile_v = "main"
          preset = "fast"
        when :archive
          crf = 18
          maxrate = nil
          bufsize = nil
          gop = nil
          profile_v = "high"
          preset = "slow"
        when :mobile
          crf = 28
          maxrate = "1500k"
          bufsize = "3000k"
          gop = 48
          profile_v = "baseline"
          preset = "fast"
        else # Default
          crf = 24
          maxrate = nil
          bufsize = nil
          gop = nil
          profile_v = "main"
          preset = "medium"
        end

        maxrate_option = maxrate ? "-maxrate #{maxrate} -bufsize #{bufsize}" : ""
        gop_option = gop ? "-g #{gop}" : ""

        content.shell_update do |old_path, new_path|
          "#{FFMPEG_COMMAND} -y -i #{old_path} #{gop_option} -map_metadata -1 -c:a aac -c:v libx264 -crf #{crf} -preset #{preset} -profile:v #{profile_v} -pix_fmt yuv420p -movflags +faststart -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' #{maxrate_option} #{new_path}"
        end
      end
    end
  end
end
