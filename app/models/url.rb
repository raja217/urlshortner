class Url < ActiveRecord::Base

 before_create :uniq_id, :short_url
	
	def uniq_id
		self.uniq_id = random(10)
	end
	def short_url
	 
	 self.shorturl = ENV['BASE_URL'] + bijective_encode(self.uniq_id)
	end


def random(len)
    randstr = ""
    chars = ("0".."9").to_a
    len.times { randstr << chars[rand(chars.size - 1)] }
    randstr.to_i
  end

ALPHABET =
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz".split(//).shuffle

def bijective_encode(i)
  # from http://refactormycode.com/codes/125-base-62-encoding
  # with only minor modification
  return ALPHABET[0] if i == 0
  s = ''
  base = ALPHABET.length
  while i > 0
    s << ALPHABET[i.modulo(base)]
    i /= base
  end
  s.reverse
end

def bijective_decode(s)
  # based on base2dec() in Tcl translation 
  # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
  i = 0
  base = ALPHABET.length
  s.each_char { |c| i = i * base + ALPHABET.index(c) }
  i
end




end
