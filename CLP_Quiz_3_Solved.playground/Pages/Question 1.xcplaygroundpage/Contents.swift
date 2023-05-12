import Foundation

// You are given an array of genes (nucleotides) defined by the "Nucleotide" enum below.

// Write a function which determines the longest consecutive sequence of one nucleotide in the genes.

// If more than 1 sequence is tied for the longest, return the first (left-most) result.

//
//Example 1
//
//genes:
//[A, T, G, C, A, A, T, T, G, G, C, C]
//
//result:
//[A, A]
//
//

//
//Example 2
//
//genes:
//[C, G, T, A, C, G, T, A, C, C, G, G, T, T, A, A, C, C, C]
//
//result:
//[C, C, C]
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

func longestConsecutiveSequence(genes: [Nucleotide]) -> [Nucleotide] {
    
    if genes.count <= 0 {
        return [Nucleotide]()
    }
    
    var resultGene = genes[0]
    var resultCount = 1
    var sequenceCount = 1
    
    var index = 1
    while index < genes.count {
        if genes[index] == genes[index - 1] {
            sequenceCount += 1
            if sequenceCount > resultCount {
                resultCount = sequenceCount
                resultGene = genes[index]
            }
        } else {
            sequenceCount = 1
        }
        index += 1
    }
    
    return [Nucleotide](repeating: resultGene, count: resultCount)
}

//-------------------------------------------------------------------

let test_1_genes = "ATGCAATTGGCC"
let test_1_result = longestConsecutiveSequence(genes: test_1_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 1: \(test_1_genes)")
print("result 1: \(test_1_result)")
print("________")

//Expected Result:
//[A, A]

//-------------------------------------------------------------------

let test_2_genes = "ATGCATGCATGC"
let test_2_result = longestConsecutiveSequence(genes: test_2_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 2: \(test_2_genes)")
print("result 2: \(test_2_result)")
print("________")

//Expected Result:
//[A]

//-------------------------------------------------------------------

let test_3_genes = "G"
let test_3_result = longestConsecutiveSequence(genes: test_3_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 3: \(test_3_genes)")
print("result 3: \(test_3_result)")
print("________")

//Expected Result:
//[G]

//-------------------------------------------------------------------

let test_4_genes = ""
let test_4_result = longestConsecutiveSequence(genes: test_4_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 4: \(test_4_genes)")
print("result 4: \(test_4_result)")
print("________")

//Expected Result:
//[]

//-------------------------------------------------------------------

let test_5_genes = "CCCAATTGGCCATGCATGC"
let test_5_result = longestConsecutiveSequence(genes: test_5_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 5: \(test_5_genes)")
print("result 5: \(test_5_result)")
print("________")

//Expected Result:
//[C, C, C]

//-------------------------------------------------------------------

let test_6_genes = "CGTACGTACCGGTTAACCC"
let test_6_result = longestConsecutiveSequence(genes: test_6_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 6: \(test_6_genes)")
print("result 6: \(test_6_result)")
print("________")

//Expected Result:
//[C, C, C]

//-------------------------------------------------------------------

let test_7_genes = "AATTCCGGAAATTTCCCGGGAAAATTTGGC"
let test_7_result = longestConsecutiveSequence(genes: test_7_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 7: \(test_7_genes)")
print("result 7: \(test_7_result)")
print("________")

//Expected Result:
//[A, A, A, A]

//-------------------------------------------------------------------

let test_8_genes = "TAAAATGGGGTCCCCT"
let test_8_result = longestConsecutiveSequence(genes: test_8_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 8: \(test_8_genes)")
print("result 8: \(test_8_result)")
print("________")

//Expected Result:
//[A, A, A, A]

//-------------------------------------------------------------------

let test_9_genes = "GGGGTAAAATCCCC"
let test_9_result = longestConsecutiveSequence(genes: test_9_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 9: \(test_9_genes)")
print("result 9: \(test_9_result)")
print("________")

//Expected Result:
//[G, G, G, G]

//-------------------------------------------------------------------

let test_10_genes = "ATGTATGCGTATGC"
let test_10_result = longestConsecutiveSequence(genes: test_10_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 10: \(test_10_genes)")
print("result 10: \(test_10_result)")
print("________")

//Expected Result:
//[A]

//-------------------------------------------------------------------

let test_11_genes = "AATTGGCCAAATTTGGGCCCCAATTGGCCAAATTTGGGCCCCC"
let test_11_result = longestConsecutiveSequence(genes: test_11_genes.compactMap { Nucleotide(rawValue: $0) })
print("test 11: \(test_11_genes)")
print("result 11: \(test_11_result)")
print("________")

//Expected Result:
//[C, C, C, C, C]



