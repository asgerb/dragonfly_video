# Dragonfly Video

[![Build Status](https://travis-ci.org/asgerb/dragonfly_video.svg)](https://travis-ci.org/asgerb/dragonfly_video) [![Gem Version](https://badge.fury.io/rb/dragonfly_video.svg)](http://badge.fury.io/rb/dragonfly_video) [![Maintainability](https://api.codeclimate.com/v1/badges/9c7b310e04bc03fae27f/maintainability)](https://codeclimate.com/github/asgerb/dragonfly_video/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9c7b310e04bc03fae27f/test_coverage)](https://codeclimate.com/github/asgerb/dragonfly_video/test_coverage)

Wraps common video-related tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dragonfly_video'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_video

## Dependencies

The gem relies on `ffmpeg` (and ruby implementation [streamio-ffmpeg](https://github.com/streamio/streamio-ffmpeg)) for reading metadata and generating screenshots of video files.

On a Mac you can install ffmpeg with homebrew: `brew install ffmpeg`.

## Usage

Add the `:video` plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin :video
end
```

## Analysers

### `video_properties`

Reads properties of a video file:

```ruby
video.video_properties

# => {
#   duration: 7.5,
#   bitrate: 481,
#   size: 455546,
#   video_stream: "h264, yuv420p, 640x480 [PAR 1:1 DAR 4:3], 371 kb/s, 16.75 fps, 15 tbr, 600 tbn, 1200 tbc",
#   video_codec: "h264",
#   colorspace: "yuv420p",
#   resolution: "640x480",
#   width: 640,
#   height: 480,
#   frame_rate: 16.72,
#   audio_stream: "aac, 44100 Hz, stereo, s16, 75 kb/s",
#   audio_codec: "aac",
#   audio_sample_rate: 44100,
#   audio_channels: 2
# }
```

## Processors

### `screenshot`

Generates a screenshot of the video's first frame:

```ruby
video.screenshot
```

### `remove_audio`

Removes audio from the video:

```ruby
video.remove_audio
```

### `optimize`

Optimizes the video based on predefined profiles: `:streaming`, `:archive`, `:mobile` or `:default`

```ruby
video.optimize
```

## Contributing

1. Fork it ( https://github.com/asgerb/dragonfly_video/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
