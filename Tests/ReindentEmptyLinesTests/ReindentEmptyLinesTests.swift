import XCTest
import class Foundation.Bundle

final class ReindentEmptyLinesTests: XCTestCase {
    
    func testNoReindent() throws {
    }
    
    func test(inputURL: URL, expectedOutputURL: URL) throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
        
        let fooBinary = productsDirectory.appendingPathComponent("ReindentEmptyLines")
        
        let process = Process()
        process.executableURL = fooBinary
        
        process.standardInput = try FileHandle(forReadingFrom: inputURL)
        
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        
        try process.run()
        process.waitUntilExit()
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: outputData, encoding: .utf8)
        
        let expectedOutputData = try Data(contentsOf: expectedOutputURL)
        let expectedOutput = String(data: expectedOutputData, encoding: .utf8)
        XCTAssertEqual(output, expectedOutput)
    }
    
    /// Returns path to the built products directory.
    var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
        #else
        return Bundle.main.bundleURL
        #endif
    }
    
    static var allTests = [
        ("testNoReindent", testNoReindent),
    ]
}
