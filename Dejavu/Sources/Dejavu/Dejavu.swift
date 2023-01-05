import libdjvu
import UIKit

public struct Dejavu {
    let parser: DjvuParser
    
    public var pageCount: Int {
        return Int(parser.numberOfPages)
    }
    public init(path: String) throws {
        self.parser = try DjvuParser(path: path)
    }
    
    public func image(for page: Int, dpi: Int) throws -> UIImage {
        return try parser.image(forPage: UInt(page), dpi: UInt(dpi))
    }
    
    
}

