#!/usr/bin/env ruby

# read phoneme transcription from dictionary.dct
dict = {}
File.open('../dictionary.dct') do |f|
  while !f.eof?
    s = f.readline.split
    key = s[0];
    unless key.start_with? "!"
      dict[key] = s[1..-1];
    end
  end
end

# write phoneme to khmer_trn.mlf
mlf = File.open '../khmer_trn.mlf', 'w'
old = File.open '../labels_word_level.mlf'

# write header
mlf.puts old.readline

while !old.eof?
  s = old.readline
  if s =~ /lab"$/
    filename = s[1..-7] 
    fid = 1
  else
    s = dict[s[0..-2]]
    pid = fid.to_s.rjust 3, '0'
    mlf.puts %Q("#{filename}-#{pid}.lab")
    mlf.puts 'sil'
    mlf.puts s
    mlf.puts 'sil'
    mlf.puts '.'
    fid += 1
  end
end

# close files
old.close
mlf.close

