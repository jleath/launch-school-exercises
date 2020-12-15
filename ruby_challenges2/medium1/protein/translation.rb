class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = ['Methionine', 'Phenylalanine', 'Leucine', 'Serine',
                 'Tyrosine', 'Cysteine', 'Tryptophan', 'STOP']
  CODON_MAP = {
               'AUG' => 0, 
               'UUU' => 1, 'UUC' => 1, 
               'UUA' => 2, 'UUG' => 2,
               'UCU' => 3, 'UCC' => 3, 'UCA' => 3, 'UCG' => 3,
               'UAU' => 4, 'UAC' => 4,
               'UGU' => 5, 'UGC' => 5,
               'UGG' => 6,
               'UAA' => 7, 'UAG' => 7, 'UGA' => 7
              }

  def self.of_codon(codon_str)
    amino_acid_id = CODON_MAP.fetch(codon_str) { raise InvalidCodonError }
    AMINO_ACIDS[amino_acid_id]
  end

  def self.of_rna(rna_str)
    codon_strings = rna_str.chars.each_slice(3).map(&:join)
    codon_strings.each_with_object([]) do |codon_str, accumulator|
      amino_acid = of_codon(codon_str)
      break accumulator if amino_acid == 'STOP'
      accumulator << amino_acid
    end
  end
end