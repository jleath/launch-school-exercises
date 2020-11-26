# DNA Strands are represented as strings consisting of the following
# possible characters: A C G T
# Each of these characters represent each base that can describe a
# single nucleotide in a DNA strand.

# We need to calculate the 'Hamming Distance' between two distinct
# strands of DNA. The Hamming distance can be calculated by counting
# the number of nucleotides at which the two strands differ.

# Example: GAGCCTACTAACGGGAT
#          CATCGTAATGACGGCCT
#          ^ ^ ^  ^ ^    ^^
# The hamming distance in this example is 7.

# If two DNA strands are not of equal length, we will only consider
# the first N nucleotides of the larger strand, where N is the number
# of nucleotides in the shorter string.

# DNA class needs an initialize method that takes a string.
# DNA class needs an instance method named hamming_distance
#  which takes another string.
class DNA
  def initialize(nucleotides)
    @nucleotides = nucleotides
  end

  def hamming_distance(other_dna)
    index = 0
    difference_count = 0
    while index < @nucleotides.size && index < other_dna.size
      difference_count += 1 if @nucleotides[index] != other_dna[index]
      index += 1
    end
    difference_count
  end
end