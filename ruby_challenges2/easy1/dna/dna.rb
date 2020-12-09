class DNA
  def initialize(dna_string)
    @dna_string = dna_string
  end

  def hamming_distance(other_dna)
    max_length = [@dna_string.size, other_dna.size].min
    (0...max_length).reduce(0) do |mutations, index|
      @dna_string[index] == other_dna[index] ? mutations : mutations + 1
    end
  end
end