require 'test_helper'

describe DragonflyVideo::Processors::Screenshot do
  let(:app) { test_app.configure_with(:video) }
  let(:processor) { DragonflyVideo::Processors::Screenshot.new }
  let(:video) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.mp4')) }

  describe 'result' do
    it 'makes a screenshot from the video' do
      image = processor.call(video)

      _(image.ext).must_equal 'jpg'
      _(image.mime_type).must_equal 'image/jpeg'
      _(image.data[0,3].bytes).must_equal [255, 216, 255]
    end
  end

  describe 'url' do
    let (:url_attributes) { OpenStruct.new }

    it 'updates the url extension to JPG by default' do
      processor.update_url(url_attributes)

      _(url_attributes.ext).must_equal 'jpg'
    end
  end
end
