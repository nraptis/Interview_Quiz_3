import Foundation

// Find the longest valid gene sequences in the array of nucleotides. Do not return duplicates.

// A valid gene sequence has the following properties:
// 1.) No nucleotide is repeated more than 3 times.
// 2.) No nucleotide is repeated 3 times in-a-row.

// Solution functions: 80%
// Solution functions in O(n) time: 100%

//Example 1
//
//genes:
//[A, A, A]
//
//longest valid sub-sequences:
//[A, A]
//
//
//Example 2
//
//genes:
//[A, T, T, A, T, T, A, T, T, A]
//
//longest valid sub-sequences:
//[T, A, T, T, A]
//[A, T, T, A, T]
//
//

enum Nucleotide: Character {
    case A = "A"
    case T = "T"
    case G = "G"
    case C = "C"
    init?(rawValue: Character) {
        switch rawValue {
        case Self.A.rawValue:
            self = .A
        case Self.T.rawValue:
            self = .T
        case Self.G.rawValue:
            self = .G
        case Self.C.rawValue:
            self = .C
        default:
            return nil
        }
    }
}

extension Nucleotide: CustomStringConvertible {
    var description: String { "\(self.rawValue)" }
}

func longestValidGeneSequence(genes: [Nucleotide]) -> [[Nucleotide]] {
    []
}


//-------------------------------------------------------------------

let test_1_genes = "AAA"
let test_1_result = longestValidGeneSequence(genes: test_1_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 1: \(test_1_genes)")
print("result 1:")
for result in test_1_result {
    print(result)
}
print("________")
//Expected Result:
//[A, A]

//-------------------------------------------------------------------

//-------------------------------------------------------------------

let test_2_genes = "ATG"
let test_2_result = longestValidGeneSequence(genes: test_2_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 2: \(test_2_genes)")
print("result 2:")
for result in test_2_result {
    print(result)
}
print("________")
//Expected Result:
//[A, T, G]

//-------------------------------------------------------------------

let test_3_genes = "ATTATTATTA"
let test_3_result = longestValidGeneSequence(genes: test_3_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 3: \(test_3_genes)")
print("result 3:")
for result in test_3_result {
    print(result)
}
print("________")
//Expected Result:
//[T, A, T, T, A]
//[A, T, T, A, T]

//-------------------------------------------------------------------

let test_4_genes = "AAATTTAATTATAAA"
let test_4_result = longestValidGeneSequence(genes: test_4_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 4: \(test_4_genes)")
print("result 4:")
for result in test_4_result {
    print(result)
}
print("________")
//Expected Result:
//[T, T, A, T, A, A]
//[A, A, T, T, A, T]
//[T, A, A, T, T, A]
//[A, T, T, A, T, A]

//-------------------------------------------------------------------

let test_5_genes = "AATTGGCCAATTGGCCAATTGGCC"
let test_5_result = longestValidGeneSequence(genes: test_5_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 5: \(test_5_genes)")
print("result 5:")
for result in test_5_result {
    print(result)
}
print("________")
//Expected Result:
//[C, A, A, T, T, G, G, C, C, A]
//[T, G, G, C, C, A, A, T, T, G]
//[A, T, T, G, G, C, C, A, A, T]
//[G, C, C, A, A, T, T, G, G, C]

//-------------------------------------------------------------------

let test_6_genes = "AAATGCCGTAAAAATGCCGTAAA"
let test_6_result = longestValidGeneSequence(genes: test_6_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 6: \(test_6_genes)")
print("result 6:")
for result in test_6_result {
    print(result)
}
print("________")
//Expected Result:
//[A, A, T, G, C, C, G, T, A]
//[A, T, G, C, C, G, T, A, A]

//-------------------------------------------------------------------

let test_7_genes = "ATGCAAATTTGGGCCCAATTGGCCATGCATGCATGCATGCAATTGGCCAAATTTGGGCCCAATTGGCCATGCATGCAATTGGCCAATTGGCCAAATTTGGGCCCATGC"
let test_7_result = longestValidGeneSequence(genes: test_7_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 7: \(test_7_genes)")
print("result 7:")
for result in test_7_result {
    print(result)
}
print("________")
//Expected Result:
//[C, A, A, T, T, G, G, C, C, A, T, G]
//[A, T, G, C, A, A, T, T, G, G, C, C]
//[A, T, T, G, G, C, C, A, T, G, C, A]
//[A, A, T, T, G, G, C, C, A, T, G, C]
//[T, G, C, A, T, G, C, A, T, G, C, A]
//[A, T, G, C, A, T, G, C, A, T, G, C]
//[C, A, T, G, C, A, A, T, T, G, G, C]
//[C, A, T, G, C, A, T, G, C, A, T, G]
//[T, G, C, A, A, T, T, G, G, C, C, A]
//[G, C, A, T, G, C, A, T, G, C, A, T]

//-------------------------------------------------------------------

let test_8_genes = "GGATTGACTCGGCAGGATTGACTCGGCAGGATTGACTCGGCAGGTCGGCAATTGACGGTCGGCAATTGACGGTCGGCAATTGACGGTCGGCAATTGAC"
let test_8_result = longestValidGeneSequence(genes: test_8_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 8: \(test_8_genes)")
print("result 8:")
for result in test_8_result {
    print(result)
}
print("________")
//Expected Result:
//[T, C, G, G, C, A, A, T, T, G, A, C]
//[A, T, T, G, A, C, T, C, G, G, C, A]
//[C, A, A, T, T, G, A, C, G, G, T, C]
//[C, A, G, G, A, T, T, G, A, C, T, C]

//-------------------------------------------------------------------

let test_9_genes = "AAAAAATTTTTTCCCCCCGGGGGG"
let test_9_result = longestValidGeneSequence(genes: test_9_genes.compactMap { Nucleotide(rawValue: $0) } )
print("test 9: \(test_9_genes)")
print("result 9:")
for result in test_9_result {
    print(result)
}
print("________")
//Expected Result:
//[A, A, T, T]
//[T, T, C, C]
//[C, C, G, G]
