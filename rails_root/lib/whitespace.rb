require 'base64'

class Whitespace
  SPACE = ' '
  TAB = "\t"
  NEWLINE = "\r\n"
  
  WHITESPACES = SPACE + TAB + NEWLINE
  
  def self.encode(str)
    base64 = Base64.encode64 str
    whitespaces = ''
    base64.length.times do |i|
      whitespaces << SPACE * (base64[i] / 100) << TAB << SPACE * (base64[i] % 100 / 10) << TAB << SPACE * (base64[i] % 10)
      whitespaces << NEWLINE
    end
    "COPY_ME_WHOLE{{#{whitespaces}}}END_COPY"
  end
  
  def self.decode(str)
    whitespaces = ''
    str.length.times do |i|
      whitespaces << str[i] if ('' << str[i]).strip.empty?
    end
    
    white_chars = whitespaces.split NEWLINE
    base64 = ''
    white_chars.each do |white|
      hundred, ten, single = white.split TAB
      single ||= ''
      base64 << hundred.length * 100 + ten.length * 10 + single.length
    end
    Base64.decode64 base64
  end
end

white = Whitespace.encode '草泥马'
original = Whitespace.decode white

puts white
puts original