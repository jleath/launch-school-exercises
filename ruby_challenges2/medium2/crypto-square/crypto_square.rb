class Crypto
  attr_reader :normalize_plaintext, :size, :plaintext_segments,
              :normalize_ciphertext, :ciphertext

  def initialize(message)
    @normalize_plaintext = message.downcase.delete('^a-z0-9')
    @size = Math.sqrt(normalize_plaintext.length).ceil
    @plaintext_segments = normalize_plaintext.scan(/(.{#{size}}|.+)/).flatten
    split_rows = plaintext_segments.map { |row| row.split('') }
    @normalize_ciphertext = split_rows[0].zip(*split_rows[1..-1])
                                         .map(&:join)
                                         .join(' ')
    @ciphertext = normalize_ciphertext.delete(' ')
  end
end