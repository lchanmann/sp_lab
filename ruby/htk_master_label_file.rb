#!/usr/bin/env ruby

require 'libxml'

module Htk
  class MasterLabelFile

    MLF_HEADER = %q{#!MLF!#}

    def initialize(files)
      @files = files
    end

    def write_to_disk(path)
      File.open(path, 'w') do |f|
        f.puts MasterLabelFile::MLF_HEADER

        @files.each do |file|
          f.puts filename(file)
          read_content(file) do |content|
            f.puts content.gsub(/\s*/, "")
          end
        end
      end
    end

    def filename(file)
      %Q{"*/#{File.basename(file)}"}
    end

    def read_content(file)
      doc = LibXML::XML::Parser.file(file).parse
      sync_nodes = doc.find("//Sync")
      sync_nodes.each do |s|
        yield s.next.content
      end
    end
  end
end

trs_files = File.join('../trs', '*.trs')
mlf = Htk::MasterLabelFile.new Dir.glob(trs_files)
mlf.write_to_disk '../labels.mlf'
