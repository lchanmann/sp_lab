#!/usr/bin/env ruby

mlf = File.open "../khmer_trnwrd.mlf", 'w'
old = File.open "../labels_word_level.mlf"

# write header
mlf.puts old.readline

while !old.eof?
  s = old.readline
  if s =~ /lab"$/
    filename = s[1..-7] 
    fid = 1
  else
    pid = fid.to_s.rjust 3, '0'
    mlf.puts %Q("#{filename}-#{pid}.lab")
    mlf.puts s
    mlf.puts "."
    fid += 1
  end
end

# close files
old.close
mlf.close

