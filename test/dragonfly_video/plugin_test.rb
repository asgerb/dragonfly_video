require 'test_helper'

describe DragonflyVideo::Plugin do
  let(:app) { test_app.configure_with(:video) }
  let(:video) { app.fetch_file(SAMPLES_DIR.join('IMG_0064.mp4')) }

  describe 'analysers' do
    it 'adds #video_properties' do
      video.must_respond_to :video_properties
    end

    [
      DragonflyVideo::Analysers::VideoProperties::VIDEO_PROPS
    ].flatten.each do |analyser|
      it "adds ##{analyser}" do
        video.must_respond_to analyser
      end
    end
  end

  describe 'processors' do
    it 'adds #screenshot' do
      video.must_respond_to :screenshot
    end
  end
end
