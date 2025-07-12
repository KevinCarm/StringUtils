import Foundation

struct StringUtils {
    /// Returns true if, and only if value length is 0 or the value is nill
        /// - Parameters:
        ///   - value: String to be analized
        ///
    public static func isEmpty(_ value: String?) -> Bool {
        return value == nil || value?.count == 0
    }
    
    /// Returns true if the string is empty or contains only white space
        /// - Parameters:
        ///   - value: String to be analized
        ///
    public static func isBlank(_ value: String?) -> Bool {
        if value == nil {
            return false
        }
        if value?.count == 0 || value?.trimmingCharacters(in: .whitespaces) == "" {
            return true
        }
        return false
    }
    
    /// Converts this string to a new character array
        /// - Parameters:
        ///   - value: String not nil no be analized
        ///
    public static func toCharArray(_ value: String) -> [Character] {
        var array: [Character] = []
        for i in value {
            array.append(i)
        }
        return array
    }
    
    /// Returns a string that is a substring of this string. The substring begins at the specified start index and extends to the character at end index - 1
        /// - Parameters:
        ///   - value: String not nil no be analized
        ///   - start: Start index of the subString
        ///   - end: End of the subString
    public static func subString(_ value: String, start: Int, end: Int) -> String {
        let startIndex = value.index(value.startIndex, offsetBy: start)
        let endIndex = value.index(value.startIndex, offsetBy: end)
        
        return String(value[startIndex..<endIndex])
    }
    
    /// Returns a string that is a substring of this string. The substring begins with the character at the specified index and extends to the end of this string.
        /// - Parameters:
        ///   - value: String not nil no be analized
        ///   - start: Start index of the subString
    public static func subString(_ value: String, start: Int) -> String {
        let startIndex = value.index(value.startIndex, offsetBy: start)
        let endIndex = value.index(value.startIndex, offsetBy: value.count)
        
        return String(value[startIndex..<endIndex])
    }
    
    /// Returns a character in the specific index
        /// - Parameters:
        ///   - value: String not nil no be analized
        ///   - index: The index of the char value
        /// - Throws: IndexOutOfBoundsException if the index argument is negative or not less than the length of this string
    public static func charAt(_ value: String, index: Int) throws -> Character {
        if index >= value.count || index < 0 {
            throw StringUtilsErrors.IndexOutOfBoundsException
        }
        let charIndex = value.index(value.startIndex, offsetBy: index)
        return value[charIndex]
    }
    
    /// Returns a hash code for this string
    /// - Parameters:
    ///     - value: String value to get it´s hashcode
    public static func hashCode(_ value: String) async -> Int32 {
        var h: Int32 = 0
        for char in value.utf16 {
            h = 31 &* h &+ Int32(char)
        }
        return h
    }
    
    /// Encodes this String into a sequence of bytes
    /// - Parameters:
        /// - value: String value to get it´s bytes
    /// - Throws: UnsupportedEncodingException if the string cannot be represented in the specified encoding (utf8)
    public static func getBytes(_ value: String) async throws -> [UInt8] {
        guard let data = value.data(using: .utf8) else {
            throw StringUtilsErrors.UnsupportedEncodingException
        }
        return Array(data)
    }
    
    /// Tests if this string starts with the specified prefix
    /// - Parameters
    ///  - value: A String value
    ///  - prefix: The prefix to look for
    public static func startWith(_ value: String, prefix: String) -> Bool {
        if prefix.count > value.count {
            return false
        }
        let startIndex = value.index(value.startIndex, offsetBy: 0)
        let endIndex = value.index(value.startIndex, offsetBy: prefix.count)
        let subString = String(value[startIndex..<endIndex])
        
        if subString == prefix {
            return true
        }
        return false
    }
    
    /// Tests if this string ends with the specified suffix
    /// - Parameters
    ///  - value: A String value
    ///  - suffix: The suffix to look for
    public static func endsWith(_ value: String, suffix: String) -> Bool {
        if suffix.count > value.count {
            return false
        }
        let startIndex = value.index(value.startIndex, offsetBy: value.count - suffix.count)
        let endIndex = value.index(value.startIndex,  offsetBy: value.count)
        let subString = String(value[startIndex..<endIndex])
        
        if subString == suffix {
            return true
        }
        return false
    }
    
    public static func contains(_ value: String, s: String) -> Bool {
        if isEmpty(value) {
            return true
        } else if s.count > value.count {
            return false
        }
        let end = subString(value, start: value.count - s.count)
        return end == s
    }
}

