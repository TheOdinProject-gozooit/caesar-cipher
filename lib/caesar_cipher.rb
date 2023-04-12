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
  if UPPER_RANGE.include?(byte) && !UPPER_RANGE.include?(shifted_byte)
    shifted_byte - 26
  elsif LOWER_RANGE.include?(byte) && !LOWER_RANGE.include?(shifted_byte)
    shifted_byte - 26
  else
    shifted_byte
  end
end

# Return true if the byte correspond to a letter, otherwise return false
def letter?(byte)
  LOWER_RANGE.include?(byte) || UPPER_RANGE.include?(byte)
end

