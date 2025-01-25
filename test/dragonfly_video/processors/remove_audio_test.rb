require "test_helper"
require "streamio-ffmpeg"

describe DragonflyVideo::Processors::RemoveAudio do
  let(:app) { test_app.configure_with(:video) }
  let(:processor) { DragonflyVideo::Processors::RemoveAudio.new }
  let(:video) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.mp4')) }

  it "removes the audio from the video" do
    processor.call(video)

    _(FFMPEG::Movie.new(video.path).audio_stream).must_equal nil
  end

  it 'does not change the video extension' do
    processor.call(video)

    _(video.ext).must_equal 'mp4'
    _(video.mime_type).must_equal 'video/mp4'
  end
end
