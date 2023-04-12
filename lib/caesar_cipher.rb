upper_range = (65..90)
lower_range = (97..122)

def caesar_cipher(str, shift_factor)
  str_bytes = str.bytes
  str_bytes.map! do |byte|
    if lower_range.include?(byte) || upper_range.include?(byte)
      byte += shift_factor
      # TODO: implement wrapper here
    end
  end
  str_bytes.pack('c*')
end
