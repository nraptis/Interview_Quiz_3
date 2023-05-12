import Foundation

// You are given an array of genes and another array of genes, which is a retrovirus.

// The genes are said to contain the retrovirus at a particular location (index) if:
// genes[index...] begins with same genes as the retrovirus, allowing for one "edit" on the retrovirus.

// An "edit" can be any of the following:
// 1.) removing a nucleotide from the gene ( [ATGC] => [ATG] )
// 2.) inserting a nucleotide into the gene ( [ATG] => [ATGC]
// 3.) replacing a nucleotide in the gene with another ( [ATGC] => [AAGC] )

// Find all of the locations in the gene which contain the retrovirus.

//
//
//Example 1
//
//genes:
//[A, T, G, C, A, T, A, T, G, C]
//retrovirus:
//[A, T, A, G, C]
//
//retrovirus locations:
//[0, 4, 6]
//
//
//
//
//Example 2
//
//genes:
//[A, T, G, C, A, T, G, C, A, T, A, T, G, A, T, G, C]
//retrovirus:
//[A, T, A, T, A, T]
//
//retrovirus locations:
//[8]
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

func retrovirusLocations(genes: [Nucleotide], retrovirus: [Nucleotide]) -> [Int] {
    
    var result = [Int]()
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: retrovirus.count + 1), count: retrovirus.count + 2)
    
    var index = 0
    
    while index < genes.count {
        for x in 0...(retrovirus.count + 1) {
            for y in 0...retrovirus.count {
                matrix[x][y] = 0
                if x == 0 { matrix[x][y] = y }
                if y == 0 { matrix[x][y] = x }
            }
        }
        
        var maxX = min(retrovirus.count + 1, genes.count - index)
        
        if retrovirus.count >= 1 {
            for y in 1...retrovirus.count {
                for x in 1...maxX {
                    let substitutionCost: Int
                    if genes[index + x - 1] == retrovirus[y - 1] {
                        substitutionCost = 0
                    } else {
                        substitutionCost = 1
                    }
                    
                    let choice1 = matrix[x - 1][y] + 1
                    let choice2 = matrix[x][y - 1] + 1
                    let choice3 = matrix[x - 1][y - 1] + substitutionCost
                    
                    matrix[x][y] = min(min(choice1, choice2), choice3)
                }
            }
        }
        
        var minCount = Int.max
        for x in 0...maxX {
            minCount = min(minCount, matrix[x][retrovirus.count])
        }
        
        if minCount <= 1 {
            result.append(index)
        }
        
        index += 1
    }
    
    return result
}

//-------------------------------------------------------------------

let test_1_genes = "ATGCATATGC"
let test_1_virus = "ATAGC"
let test_1_result = retrovirusLocations(genes: test_1_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_1_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 1 genes: \(test_1_genes)")
print("test 1 retrovirus: \(test_1_virus)")
print("test 1 locations: \(test_1_result)")
print("________")

//Expected Result:
//[0, 4, 6]

//-------------------------------------------------------------------

let test_2_genes = "ATGCATGCATATGATGC"
let test_2_virus = "ATATAT"
let test_2_result = retrovirusLocations(genes: test_2_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_2_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 2 genes: \(test_2_genes)")
print("test 2 retrovirus: \(test_2_virus)")
print("test 2 locations: \(test_2_result)")
print("________")

//Expected Result:
//[8]

//-------------------------------------------------------------------

let test_3_genes = "AAATTTGGGCCC"
let test_3_virus = "AAAATTTGGGCCC"
let test_3_result = retrovirusLocations(genes: test_3_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_3_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 3 genes: \(test_3_genes)")
print("test 3 retrovirus: \(test_3_virus)")
print("test 3 locations: \(test_3_result)")
print("________")

//Expected Result:
//[0]

//-------------------------------------------------------------------

let test_4_genes = "AAATTTGGGCCC"
let test_4_virus = "AAATATGGGCCC"
let test_4_result = retrovirusLocations(genes: test_4_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_4_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 4 genes: \(test_4_genes)")
print("test 4 retrovirus: \(test_4_virus)")
print("test 4 locations: \(test_4_result)")
print("________")

//Expected Result:
//[0]

//-------------------------------------------------------------------

let test_5_genes = "AATTTGGGCCC"
let test_5_virus = "AAATTTGGGCCC"
let test_5_result = retrovirusLocations(genes: test_5_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_5_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 5 genes: \(test_5_genes)")
print("test 5 retrovirus: \(test_5_virus)")
print("test 5 locations: \(test_5_result)")
print("________")

//Expected Result:
//[0]

//-------------------------------------------------------------------

let test_6_genes = "ATATATAGCATAGCATATATGAC"
let test_6_virus = "ATATGC"
let test_6_result = retrovirusLocations(genes: test_6_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_6_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 6 genes: \(test_6_genes)")
print("test 6 retrovirus: \(test_6_virus)")
print("test 6 locations: \(test_6_result)")
print("________")

//Expected Result:
//[2, 4, 9, 16]

//-------------------------------------------------------------------

let test_7_genes = "ATGCATGCATGCATGCATGCATGCATGCATGCATGCATGC"
let test_7_virus = "ATGCATATGC"
let test_7_result = retrovirusLocations(genes: test_7_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_7_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 7 genes: \(test_7_genes)")
print("test 7 retrovirus: \(test_7_virus)")
print("test 7 locations: \(test_7_result)")
print("________")

//Expected Result:
//[]

//-------------------------------------------------------------------

let test_8_genes = "ATGCATGCATGCATGCATGCATGCATGCATGCATGCATGC"
let test_8_virus = "ATGCATGCATGC"
let test_8_result = retrovirusLocations(genes: test_8_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_8_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 8 genes: \(test_8_genes)")
print("test 8 retrovirus: \(test_8_virus)")
print("test 8 locations: \(test_8_result)")
print("________")

//Expected Result:
//[0, 1, 3, 4, 5, 7, 8, 9, 11, 12, 13, 15, 16, 17, 19, 20, 21, 23, 24, 25, 27, 28, 29]

//-------------------------------------------------------------------

let test_9_genes = "ATGCATGCATGC"
let test_9_virus = ""
let test_9_result = retrovirusLocations(genes: test_9_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_9_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 9 genes: \(test_9_genes)")
print("test 9 retrovirus: \(test_9_virus)")
print("test 9 locations: \(test_9_result)")
print("________")

//Expected Result:
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

//-------------------------------------------------------------------

let test_10_genes = "ATGCATGCATGC"
let test_10_virus = "A"
let test_10_result = retrovirusLocations(genes: test_10_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_10_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 10 genes: \(test_10_genes)")
print("test 10 retrovirus: \(test_10_virus)")
print("test 10 locations: \(test_10_result)")
print("________")

//Expected Result:
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

//-------------------------------------------------------------------

let test_11_genes = "ATGCATGCATGC"
let test_11_virus = "AA"
let test_11_result = retrovirusLocations(genes: test_11_genes.compactMap { Nucleotide(rawValue: $0) },
                                  retrovirus: test_11_virus.compactMap { Nucleotide(rawValue: $0) })
print("test 11 genes: \(test_11_genes)")
print("test 11 retrovirus: \(test_11_virus)")
print("test 11 locations: \(test_11_result)")
print("________")

//Expected Result:
//[0, 3, 4, 7, 8]
