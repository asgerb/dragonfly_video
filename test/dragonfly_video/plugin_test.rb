require 'test_helper'

describe DragonflyVideo::Plugin do
  let(:app) { test_app.configure_with(:video) }
  let(:mp4) { app.fetch_file(SAMPLES_DIR.join("sample.mp4")) }
  let(:mov) { app.fetch_file(SAMPLES_DIR.join("sample.mov")) }

  it 'adds #video_properties' do
    _(mp4).must_respond_to :video_properties
    _(mov).must_respond_to :video_properties
  end

  [
    DragonflyVideo::Analysers::VideoProperties::VIDEO_PROPS
  ].flatten.each do |analyser|
    it "adds ##{analyser}" do
      _(mp4).must_respond_to analyser
      _(mov).must_respond_to analyser
    end
  end

  it 'adds #screenshot' do
    _(mp4).must_respond_to :screenshot
    _(mov).must_respond_to :screenshot
  end
end
