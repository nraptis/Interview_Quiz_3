import Foundation

// You are given an array of genes (nucleotides) defined by the "Nucleotide" enum below.

// Write a function which moves all G's to the end of the gene array.

// The ordering non-G elements should be preserved.

//
//Example 1
//
//genes:
//[A, T, G, C, A, T, T, G, C, A]
//
//result:
//[A, T, C, A, T, T, C, A, G, G]
//
//

//
//Example 2
//
//genes:
//[A, T, C, A, T, C]
//
//result:
//[A, T, C, A, T, C]
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

func moveGsToEnd(genes: inout [Nucleotide]) {
    
    var countG = 0
    
    for index in 0..<genes.count {
        let nucleotide = genes[index]
        switch nucleotide {
        case .G:
            countG += 1
        default:
            genes[index - countG] = nucleotide
        }
    }
    
    for index in (genes.count - countG)..<genes.count {
        genes[index] = .G
    }
}

//-------------------------------------------------------------------

var test_1_genes = "ATGCATTGCA".compactMap { Nucleotide(rawValue: $0) }
print("test 1: \(test_1_genes)")
moveGsToEnd(genes: &test_1_genes)
print("result 1: \(test_1_genes)")
print("________")

//Expected Result:
//[A, T, C, A, T, T, C, A, G, G]

//-------------------------------------------------------------------

var test_2_genes = "ATCATCAATTCC".compactMap { Nucleotide(rawValue: $0) }
print("test 2: \(test_2_genes)")
moveGsToEnd(genes: &test_2_genes)
print("result 2: \(test_2_genes)")
print("________")

//Expected Result:
//[A, T, C, A, T, C, A, A, T, T, C, C]

//-------------------------------------------------------------------

var test_3_genes = "GAGTGAGAGTGAG".compactMap { Nucleotide(rawValue: $0) }
print("test 3: \(test_3_genes)")
moveGsToEnd(genes: &test_3_genes)
print("result 3: \(test_3_genes)")
print("________")

//Expected Result:
//[A, T, A, A, T, A, G, G, G, G, G, G, G]

//-------------------------------------------------------------------

var test_4_genes = "GGG".compactMap { Nucleotide(rawValue: $0) }
print("test 4: \(test_4_genes)")
moveGsToEnd(genes: &test_4_genes)
print("result 4: \(test_4_genes)")
print("________")

//Expected Result:
//[G, G, G]

//-------------------------------------------------------------------

var test_5_genes = "G".compactMap { Nucleotide(rawValue: $0) }
print("test 5: \(test_5_genes)")
moveGsToEnd(genes: &test_5_genes)
print("result 5: \(test_5_genes)")
print("________")

//Expected Result:
//[G]

//-------------------------------------------------------------------

var test_6_genes = "A".compactMap { Nucleotide(rawValue: $0) }
print("test 6: \(test_6_genes)")
moveGsToEnd(genes: &test_6_genes)
print("result 6: \(test_6_genes)")
print("________")

//Expected Result:
//[A]

//-------------------------------------------------------------------

var test_7_genes = "".compactMap { Nucleotide(rawValue: $0) }
print("test 7: \(test_7_genes)")
moveGsToEnd(genes: &test_7_genes)
print("result 7: \(test_7_genes)")
print("________")

//Expected Result:
//[]

//-------------------------------------------------------------------

var test_8_genes = "AAAGGGTTT".compactMap { Nucleotide(rawValue: $0) }
print("test 8: \(test_8_genes)")
moveGsToEnd(genes: &test_8_genes)
print("result 8: \(test_8_genes)")
print("________")

//Expected Result:
//[A, A, A, T, T, T, G, G, G]

//-------------------------------------------------------------------

var test_9_genes = "GGGAAATTT".compactMap { Nucleotide(rawValue: $0) }
print("test 9: \(test_9_genes)")
moveGsToEnd(genes: &test_9_genes)
print("result 9: \(test_9_genes)")
print("________")

//Expected Result:
//[A, A, A, T, T, T, G, G, G]

//-------------------------------------------------------------------

var test_10_genes = "AAATTTGGG".compactMap { Nucleotide(rawValue: $0) }
print("test 10: \(test_10_genes)")
moveGsToEnd(genes: &test_10_genes)
print("result 10: \(test_10_genes)")
print("________")

//Expected Result:
//[A, A, A, T, T, T, G, G, G]

//-------------------------------------------------------------------

var test_11_genes = "TGTGAGGAGAAGTGTGGGGG".compactMap { Nucleotide(rawValue: $0) }
print("test 11: \(test_11_genes)")
moveGsToEnd(genes: &test_11_genes)
print("result 11: \(test_11_genes)")
print("________")

//Expected Result:
//[T, T, A, A, A, A, T, T, G, G, G, G, G, G, G, G, G, G, G, G]
