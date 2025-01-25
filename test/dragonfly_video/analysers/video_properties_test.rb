require "test_helper"

describe DragonflyVideo::Analysers::VideoProperties do
  let(:app) { test_app.configure_with(:video) }
  let(:mp4) { app.fetch_file(SAMPLES_DIR.join('sample.mp4')) }
  let(:mov) { app.fetch_file(SAMPLES_DIR.join('sample.mov')) }

  it 'analyses "duration" property' do
    _(mp4.duration).must_equal 13.68
    _(mov.duration).must_equal 15.0
  end

  it 'analyses "bitrate" property' do
    _(mp4.bitrate).must_equal 2997532
    _(mov.bitrate).must_equal 1718687
  end

  it 'analyses "size" property' do
    _(mp4.size).must_equal 5125781
    _(mov.size).must_equal 3222539
  end

  it 'analyses "video_stream" property' do
    _(mp4.video_stream).must_equal "h264 (Baseline) (avc1 / 0x31637661), yuv420p, 720x1280 [SAR  DAR ]"
    _(mov.video_stream).must_equal "h264 (Main) (avc1 / 0x31637661), yuv420p, 640x1136 [SAR  DAR ]"
  end

  it 'analyses "video_codec" property' do
    _(mp4.video_codec).must_equal "h264"
    _(mov.video_codec).must_equal "h264"
  end

  it 'analyses "colorspace" property' do
    _(mp4.colorspace).must_equal "yuv420p"
    _(mov.colorspace).must_equal "yuv420p"
  end

  it 'analyses "resolution" property' do
    _(mp4.resolution).must_equal "720x1280"
    _(mov.resolution).must_equal "640x1136"
  end

  it 'analyses "width" property' do
    _(mp4.width).must_equal 720
    _(mov.width).must_equal 640
  end

  it 'analyses "height" property' do
    _(mp4.height).must_equal 1280
    _(mov.height).must_equal 1136
  end

  it 'analyses "frame_rate" property' do
    _(mp4.frame_rate.to_f).must_equal 29.89766081871345
    _(mov.frame_rate.to_f).must_equal 30.0
  end

  it 'analyses "audio_stream" property' do
    _(mp4.audio_stream).must_equal "aac (mp4a / 0x6134706d), 44100 Hz, mono, fltp, 63418 bit/s"
    _(mov.audio_stream).must_equal "aac (mp4a / 0x6134706d), 44100 Hz, stereo, fltp, 64125 bit/s"
  end

  it 'analyses "audio_codec" property' do
    _(mp4.audio_codec).must_equal "aac"
    _(mov.audio_codec).must_equal "aac"
  end

  it 'analyses "audio_sample_rate" property' do
    _(mp4.audio_sample_rate).must_equal 44100
    _(mov.audio_sample_rate).must_equal 44100
  end

  it 'analyses "audio_channels" property' do
    _(mp4.audio_channels).must_equal 1
    _(mov.audio_channels).must_equal 2
  end
end
