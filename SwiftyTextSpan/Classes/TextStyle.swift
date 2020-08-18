//
//  TextStyle.swift
//  Pods-SwiftyTextSpan_Example
//
//  Created by Mark G on 3/21/20.
//

import UIKit

public struct TextStyle {
    public let color: UIColor?
    public let font: UIFont?
    public let underlineStyle: NSUnderlineStyle?
    public let underlineColor: UIColor?
    public let strikethroughStyle: NSUnderlineStyle?
    public let strikethroughColor: UIColor?
    public let textAlignment: NSTextAlignment?
    
    public init(
        color: UIColor? = nil,
        font: UIFont? = nil,
        underlineStyle: NSUnderlineStyle? = nil,
        underlineColor: UIColor? = nil,
        strikethroughStyle: NSUnderlineStyle? = nil,
        strikethroughColor: UIColor? = nil,
        textAlignment: NSTextAlignment? = nil
    ) {
        self.color = color
        self.font = font
        
        self.underlineStyle = underlineStyle
        self.underlineColor = underlineColor
        
        self.strikethroughStyle = strikethroughStyle
        self.strikethroughColor = strikethroughColor
        
        self.textAlignment = textAlignment
        
    }
    
    /// Apply current style to text with modifier
    func apply(to text: String, style: TextStyle? = nil)-> NSAttributedString {
        
        let attributes = toAttributes(style: style)
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    /// Merge style between styles
    func merge(with other: TextStyle?) -> TextStyle {
        guard let other = other else { return self }
        
        return TextStyle(
            color: other.color ?? color,
            font: other.font ?? font,
            underlineStyle: other.underlineStyle ?? underlineStyle,
            underlineColor: other.underlineColor ?? underlineColor,
            strikethroughStyle: other.strikethroughStyle ?? strikethroughStyle,
            strikethroughColor: other.strikethroughColor ?? strikethroughColor,
            textAlignment: other.textAlignment ?? textAlignment
        )
    }
    
    /// Merge attributes
    public func toAttributes(style: TextStyle? = nil) -> [NSAttributedString.Key:Any] {
        var attributes = [NSAttributedString.Key:Any]()
        
        // Color
        if let color = color ?? style?.color {
            attributes[.foregroundColor] = color
        }
        
        // Font
        if let font = font ?? style?.font {
            attributes[.font] = font
        }
        
        // Underline style
        if let underlineStyle = underlineStyle ?? style?.underlineStyle {
            attributes[.underlineStyle] = underlineStyle.rawValue
        }
        
        // Strikethrough style
        if let strikethroughStyle = strikethroughStyle ?? style?.strikethroughStyle {
            attributes[.strikethroughStyle] = strikethroughStyle.rawValue
        }
        
        // Paragraph style
        if let textAlignment = textAlignment {
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = textAlignment
            attributes[.paragraphStyle] = paragraph
        }
        
        return attributes
    }
}

// MARK: - Modifier
public extension TextStyle {
    
    // Color
    static func color(_ color: UIColor) -> TextStyle {
        return TextStyle(color: color)
    }
    
    // Underline Style
    static func underlineStyle(_ style: NSUnderlineStyle) -> TextStyle {
        return TextStyle(underlineStyle: style)
    }
    
    // Underline Color
    static func underlineColor(_ color: UIColor) -> TextStyle {
        return TextStyle(underlineColor: color)
    }
    
    // Strikethrough Style
    static func strikethroughStyle(_ style: NSUnderlineStyle) -> TextStyle {
        return TextStyle(strikethroughStyle: style)
    }
    
    // Strikethrough Color
    static func strikethroughColor(_ color: UIColor)-> TextStyle {
        return TextStyle(strikethroughColor: color)
    }
    
    // Font
    static func font(_ font: UIFont) -> TextStyle {
        return TextStyle(font: font)
    }
    
    // Font
    static func textAlignment(_ textAlignment: NSTextAlignment) -> TextStyle {
        return TextStyle(textAlignment: textAlignment)
    }
}
