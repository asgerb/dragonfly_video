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

  it 'does not change the video extension' do
    processor.call(video)

    _(video.ext).must_equal 'mp4'
    _(video.mime_type).must_equal 'video/mp4'
  end
end
