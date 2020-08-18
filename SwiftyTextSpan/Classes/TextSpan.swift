import UIKit

//
public class TextSpan {
    var children = [TextSpan]()
    public let text: String
    public let style: TextStyle?
    
    public init(
        text: String,
        style: TextStyle? = nil
    ) {
        self.text = text
        self.style = style
    }
    
    public convenience init(_ text: String, style: TextStyle? = nil) {
        self.init(text: text, style: style)
    }
    
    /// Append text with style to this `TextSpan`
    @discardableResult
    public func append(text: String, modifier: TextStyle? = nil)-> Self {
        let style = self.style != nil ? self.style?.merge(with: modifier) : modifier
        let textSpan = TextSpan(text: text, style: style)
        children.append(textSpan)
        
        return self
    }
    
    @discardableResult
    public func append(_ text: String, modifier: TextStyle? = nil)-> Self {
        append(text: text, modifier: modifier)
    }
    
    /// Export to `NSAttributedString`
    public func asAttributedString() -> NSAttributedString {
        let attributedString: NSMutableAttributedString =
            style?.apply(to: text).mutableCopy() as? NSMutableAttributedString
            ?? NSMutableAttributedString(string: text)
        
        for child in children {
            attributedString.append(child.asAttributedString())
        }
        
        return attributedString
    }
}
