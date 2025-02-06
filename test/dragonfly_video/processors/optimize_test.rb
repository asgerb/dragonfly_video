require "test_helper"
require "streamio-ffmpeg"

describe DragonflyVideo::Processors::Optimize do
  let(:app) { test_app.configure_with(:video) }
  let(:processor) { DragonflyVideo::Processors::Optimize.new }
  let(:video) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.mp4')) }

  it "optimizes the video" do
    original_size = video.size
    processor.call(video)
    movie = FFMPEG::Movie.new(video.path)

    _(movie).must_be :valid?
    _(movie.size).must_be :<, original_size
  end

  describe "profiles" do
    it "accepts streaming profile" do
      processor.call(video, profile: :streaming)
      movie = FFMPEG::Movie.new(video.path)

      _(movie).must_be :valid?
      _(movie.video_codec).must_equal "h264"
      _(movie.video_stream).must_include "(Main)"
    end

    it "accepts archive profile" do
      processor.call(video, profile: :archive)
      movie = FFMPEG::Movie.new(video.path)

      _(movie).must_be :valid?
      _(movie.video_codec).must_equal "h264"
      _(movie.video_stream).must_include "(High)"
    end

    it "accepts mobile profile" do
      processor.call(video, profile: :mobile)
      movie = FFMPEG::Movie.new(video.path)

      _(movie).must_be :valid?
      _(movie.video_codec).must_equal "h264"
      _(movie.video_stream).must_include "(Constrained Baseline)"
    end

    it "uses default profile when none specified" do
      processor.call(video)
      movie = FFMPEG::Movie.new(video.path)

      _(movie).must_be :valid?
      _(movie.video_codec).must_equal "h264"
      _(movie.video_stream).must_include "(Main)"
    end

    it "uses default profile for invalid profiles" do
      processor.call(video, profile: :invalid_profile)
      movie = FFMPEG::Movie.new(video.path)

      _(movie).must_be :valid?
      _(movie.video_codec).must_equal "h264"
      _(movie.video_stream).must_include "(Main)"
    end
  end

  it 'does not change the video extension' do
    processor.call(video)

    _(video.ext).must_equal 'mp4'
    _(video.mime_type).must_equal 'video/mp4'
  end
end
