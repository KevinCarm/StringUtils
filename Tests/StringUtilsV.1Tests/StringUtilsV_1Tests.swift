import Testing
@testable import StringUtilsV_1

struct StringUtilsV_1 {

    @Test func executeIsEmptyTest() async throws {
        #expect(StringUtils.isEmpty("") == true)
        #expect(StringUtils.isEmpty(nil) == true)
        #expect(StringUtils.isEmpty("Hello, World") == false)
    }
    
    @Test func executeIsBlankTest() {
        #expect(StringUtils.isBlank("") == true)
        #expect(StringUtils.isBlank("  ") == true)
        #expect(StringUtils.isBlank(nil) == false)
        #expect(StringUtils.isBlank("Hello, World") == false)
    }
    
    @Test func executeToCharArrayTest() {
        let value: [Character] = ["H", "e", "l", "l", "o"]
        #expect(StringUtils.toCharArray("Hello") == value)
    }
    
    @Test func executeSubStringTest() {
        let originalString = "Hello"
        let spectedString = "Hel"
        #expect(
            StringUtils
                .subString(originalString, start: 0, end: 3) == spectedString
        )
    }
    
    @Test func executecCharAtTest() {
        let originalString = "Hello"
        do {
            let result = try StringUtils.charAt(originalString, index: 0)
            #expect(result == "H")
        } catch let error as StringUtilsErrors {
            #expect(error == StringUtilsErrors.IndexOutOfBoundsException)
        } catch {
            #expect(Bool(false), "Caught an unexpected error type: \(error)")
        }
    }
    
    @Test func executeHashCodeTest() async {
        let originalString = "Hello"
        let hashCode = await StringUtils.hashCode(originalString)
        #expect(hashCode == 69609650)
    }
    
    @Test func executeBetByteTest() async throws {
        let originalString = "Hello"
        let bytes: [UInt8] = [72, 101, 108, 108, 111]
        #expect(try await StringUtils.getBytes(originalString) == bytes)
    }
    
    @Test func executeStsartWithTest()  {
        let originalString = "Hello"
        #expect(StringUtils.startWith(originalString, prefix: "H") == true)
        #expect(StringUtils.startWith(originalString, prefix: "He") == true)
        #expect(StringUtils.startWith(originalString, prefix: "Hi") == false)
    }
    
    @Test func executeEndsWithTest()  {
        let originalString = "Hello"
        #expect(StringUtils.endsWith(originalString, suffix: "o") == true)
        #expect(StringUtils.endsWith(originalString, suffix: "lo") == true)
        #expect(StringUtils.endsWith(originalString, suffix: "        ") == false)
    }
    
    @Test func executeContainsTest()  {
        let originalString = "HelloWorldllo"
        #expect(StringUtils.contains(originalString, s: "dllo") == true)
        #expect(StringUtils.contains(originalString, s: "la") == false)
        #expect(StringUtils.contains(originalString, s: "o") == true)
    }
}
