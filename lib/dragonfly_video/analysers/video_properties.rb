require 'streamio-ffmpeg'

# IMPORTANT: See https://github.com/streamio/streamio-ffmpeg

module DragonflyVideo
  module Analysers
    class VideoProperties
      VIDEO_PROPS = %i(duration bitrate size video_stream video_codec colorspace
                       resolution width height frame_rate audio_stream audio_codec
                       audio_sample_rate audio_channels).freeze

      def call(content)
        ffmpeg(content)
      end

      private

      def ffmpeg(content)
        res = {}
        movie = FFMPEG::Movie.new(content.path)
        if movie.valid?
          VIDEO_PROPS.each do |prop_name|
            res[prop_name] = movie.send(prop_name)
          end
        end
        res
      end
    end
  end
end
