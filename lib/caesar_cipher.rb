upper_range = (65..90)
lower_range = (97..122)

def caesar_cipher(str, shift_factor)
  str_bytes = str.bytes
  str_bytes.map! { |byte| shifter(byte, shift_factor) if letter?(byte) }
  str_bytes.pack('c*')
end

def shifter(byte, shift_factor)
  shifted_byte = byte + shift_factor
  if upper_range.include?(byte) && !upper_range.include?(shifted_byte)
    shifted_byte - 26
  elsif lower_range.include?(byte) && !lower_range.include?(shifted_byte)
    shifted_byte - 26
  else
    shifted_byte
  end
end

def letter?(byte)
  lower_range.include?(byte) || upper_range.include?(byte)
end
