UPPER_RANGE = (65..90).freeze
LOWER_RANGE = (97..122).freeze

# Returns a shifted string accordingly to the shift factor
def caesar_cipher(str, shift_factor)
  str_bytes = str.bytes
  str_bytes.map! { |byte| letter?(byte) ? shifter(byte, shift_factor) : byte }
  str_bytes.pack('c*')
end

# Return the shifted byte accordingly to the shift factor, includes the wraps
def shifter(byte, shift_factor)
  shifted_byte = byte + shift_factor
  wrapper = shift_factor.negative? ? 26 : -26
  if UPPER_RANGE.include?(byte) && !UPPER_RANGE.include?(shifted_byte)
    shifted_byte + wrapper
  elsif LOWER_RANGE.include?(byte) && !LOWER_RANGE.include?(shifted_byte)
    shifted_byte + wrapper
  else
    shifted_byte
  end
end

# Return true if the byte correspond to a letter (/[A-Za-z]/), otherwise return false
def letter?(byte)
  LOWER_RANGE.include?(byte) || UPPER_RANGE.include?(byte)
end

# Add TOP example so can be run with "ruby ./caesar_cipher.rb"

puts 'Using Caesar Cipher with a shift factor of 5 on "What a string!" :'
puts caesar_cipher('What a string!', 5) # returns "Bmfy f xywnsl!"
