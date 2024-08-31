class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    raise ArgumentError, "Number must be a non-negative integer" unless number.is_a?(Integer) && number >= 0

    return ALPHABET[0] if number.zero?

    result = ""
    while number.positive?
      result << ALPHABET[number % BASE]
      number /= BASE
    end

    result.reverse
  end

  def self.decode(string)
    raise ArgumentError, "Input must be a non-empty string with valid characters" unless valid_string?(string)

    string.each_char.reduce(0) do |number, char|
      number * BASE + ALPHABET.index(char)
    end
  end


  private

  def self.valid_string?(string)
    string.is_a?(String) && !string.empty? && string.chars.all? { |char| ALPHABET.include?(char) }
  end

end
