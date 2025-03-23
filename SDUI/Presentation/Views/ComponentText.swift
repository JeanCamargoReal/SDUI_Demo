//
//  ComponentText.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

/// Modelo para representar textos em componentes
struct ComponentText: Decodable {
    let content: String
    let fontSize: CGFloat?
    let fontWeight: String?
    let color: String?
    let maxLines: Int?
    
    func toSwiftUIFont() -> Font {
        let size = fontSize ?? 14
        let base = Font.system(size: size)
        
        switch fontWeight?.lowercased() {
        case "bold": return base.bold()
        case "medium": return base.weight(.medium)
        case "light": return base.weight(.light)
        default: return base
        }
    }
    
    func toSwiftUIColor() -> Color {
        guard let colorStr = color, !colorStr.isEmpty else {
            return .primary
        }
        
        // Assume hexadecimal
        if colorStr.hasPrefix("#") {
            let hex = colorStr.dropFirst()
            var rgbValue: UInt64 = 0
            Scanner(string: String(hex)).scanHexInt64(&rgbValue)
            
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            
            return Color(red: r, green: g, blue: b)
        }
        
        // Cores padrão
        switch colorStr.lowercased() {
        case "red": return .red
        case "blue": return .blue
        case "green": return .green
        case "black": return .black
        case "white": return .white
        default: return .primary
        }
    }
}
