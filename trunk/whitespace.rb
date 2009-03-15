require 'base64'

class Whitespace
  SPACE = ' '
  TAB = "\t"
  
  def self.encode(str)
    base64 = Base64.encode64 str
    whitespaces = ''
    base64.length.times do |i|
      whitespaces << (SPACE * base64[i])
      whitespaces << TAB
    end
    whitespaces
  end
  
  def self.decode(whitespaces)
    white_chars = whitespaces.split TAB
    base64 = ''
    white_chars.each do |white|
      base64 << white.length
    end
    Base64.decode64 base64
  end
end

white = Whitespace.encode '草泥马'
original = Whitespace.decode white

puts white
puts original