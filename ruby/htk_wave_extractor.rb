#!/usr/bin/env ruby

require 'wavefile'

module Htk
  class WaveExtractor
    include WaveFile

    WAV_SAMPLE_RATE = 8000
    WAV_FORMAT = Format.new :mono, :pcm_16, WAV_SAMPLE_RATE

    def initialize output_dir
      @output_dir = output_dir
      Dir.mkdir(output_dir) unless Dir.exist? output_dir
    end

    def open file
      @reader.close if @reader
      @file = file
      @file_ind = 1
      @reader = Reader.new file
    end

    def extract chunk
      start, length = chunk
      return unless length
      Writer.new(next_fid, WAV_FORMAT) do |writer|
        writer.write @reader.seek_and_read(start.to_f, length.to_f)
        @file_ind += 1
      end
    end

    def next_fid
      extname = File.extname @file
      filename = @file[0...@file.index(extname)] << "-" << @file_ind.to_s.rjust(3, '0') << extname
      File.join @output_dir, File.basename(filename)
    end

  end
end

WAV_DIR = '../wav'.freeze
OUTPUT_DIR = 'wav_out/'
WAV_REGEXP = /\.(wav|wave)$/

extractor = Htk::WaveExtractor.new OUTPUT_DIR
File.open('time_marks.txt', 'r') do |file|
  file.each do |line|
    extractor.open File.join(WAV_DIR, line.chomp) if line =~ WAV_REGEXP
    extractor.extract line.split
  end
end
