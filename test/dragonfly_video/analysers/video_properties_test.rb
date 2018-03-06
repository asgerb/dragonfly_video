require 'test_helper'

describe DragonflyVideo::Analysers::VideoProperties do
  let(:app) { test_app.configure_with(:video) }
  let(:video) { app.fetch_file(SAMPLES_DIR.join('IMG_0064.mp4')) }


  it 'analyses "duration" property' do
    video.duration.must_equal 13.68
  end

  it 'analyses "bitrate" property' do
    video.bitrate.must_equal 2997532
  end

  it 'analyses "size" property' do
    video.size.must_equal 5125781
  end

  it 'analyses "video_stream" property' do
    video.video_stream.must_equal "h264 (Baseline) (avc1 / 0x31637661), yuv420p, 720x1280 [SAR 0:1 DAR 0:1]"
  end

  it 'analyses "video_codec" property' do
    video.video_codec.must_equal "h264"
  end

  it 'analyses "colorspace" property' do
    video.colorspace.must_equal "yuv420p"
  end

  it 'analyses "resolution" property' do
    video.resolution.must_equal "720x1280"
  end

  it 'analyses "width" property' do
    video.width.must_equal 720
  end

  it 'analyses "height" property' do
    video.height.must_equal 1280
  end

  it 'analyses "frame_rate" property' do
    video.frame_rate.to_f.must_equal 29.89766081871345
  end

  it 'analyses "audio_stream" property' do
    video.audio_stream.must_equal "aac (mp4a / 0x6134706d), 44100 Hz, mono, fltp, 63418 bit/s"
  end

  it 'analyses "audio_codec" property' do
    video.audio_codec.must_equal "aac"
  end

  it 'analyses "audio_sample_rate" property' do
    video.audio_sample_rate.must_equal 44100
  end

  it 'analyses "audio_channels" property' do
    video.audio_channels.must_equal 1
  end
end
