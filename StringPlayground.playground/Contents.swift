import NaturalLanguage

var poem = "By the shores of Gitche Gumee, By the shining Big-Sea-Water Stood the wigwam of Nokomis Daughter of the moon Nokomis. Dark behind it rose the forest."

var words = [String]()


//Syntax Swift 4+

//let range = firstIndex..<secondIndex // If you have a range
//let newStr = = str.substring(with: range) // Swift 3
//let newStr = String(str[range])  // Swift 4

//Range<String.Index>

if #available(iOS 12.0, *) {
    let taggerLexical = NLTagger(tagSchemes: [.lexicalClass, .lemma])
    taggerLexical.string = poem
    
    taggerLexical.enumerateTags(in: poem.startIndex..<poem.endIndex, unit: .word, scheme: .lexicalClass, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
        
        words.append(poem.substring(with: tokenRange)) // The original warning.
        // words.append(poem[tokenRange]) // This is an error: Subscript 'subscript(_:)' requires the types 'String.Index' and 'Int' be equivalent
        print(type(of: poem[tokenRange])) //Type Substring

        print(poem.substring(with: tokenRange)) //Original
        print(poem[tokenRange.lowerBound..<tokenRange.upperBound]) //Breaking Range into lower and upper bounds
        print(String(poem[tokenRange])) //Using range to generate Substring

        return true
    }
}

print("Word cound: \(words.count)")

