# SwiftStringSlicingSubscript
A playground to figure out the intracacies of String Subscripts and Slicing

I was toying around with the 'Natural Language' Framework for iOS when I got a warning about a deprecated line.

https://developer.apple.com/documentation/foundation/nslinguistictagger/tokenizing_natural_language_text

```fromString.substring(with: tokenRange)```

This produced the warning: substring(with:) is deprecated: Please use String slicing subscript.

I looked up the new docs on String slicing and it looked as though I could just put the range in brackets and get what I wanted.

I thought, hey this is easy. 

```fromString[tokenRange]```

https://developer.apple.com/documentation/swift/substring

But that produced a hard error: Subscript 'subscript(_:)' requires the types 'String.Index' and 'Int' be equivalent.

I broke out the range into its lower and upper bounds. It gave the same error.

```tokenRange.lowerBound..<tokenRange.upperBound]```

I printed out the type and it showed Subscript. Of course, it was the wrong type for my string array [String]! These substring methods are very interesting and are basically just a reference to the original String. There is even a warning on the Apple docs for Substring.

So I actually just needed to cast it into a String from that Substring:

```String(fromString[tokenRange])```