require 'test_helper'

describe DragonflyVideo::Processors::Screenshot do
  let(:app) { test_app.configure_with(:video) }
  let(:processor) { DragonflyVideo::Processors::Screenshot.new }
  let(:video) { Dragonfly::Content.new(app, SAMPLES_DIR.join('IMG_0064.mp4')) }

  describe 'result' do
    it 'makes a screenshot from the video' do
      image = processor.call(video)
      image.ext.must_equal 'jpg'
      image.mime_type.must_equal 'image/jpeg'
      image.data[0,3].bytes.must_equal [255, 216, 255]
    end
  end

  describe 'url' do
    let (:url_attributes) { OpenStruct.new }

    it 'updates the url extension to JPG by default' do
      processor.update_url(url_attributes)
      url_attributes.ext.must_equal 'jpg'
    end
  end
end
