import Foundation
import SwiftUI

extension View {
    
    func addGlowEffect(color1:Color, color2:Color, color3:Color) -> some View {
        self
            .foregroundColor(Color(hue: 0.5, saturation: 0.5, brightness: 0.6))
            .background { self.foregroundColor(color1).blur(radius: 0).brightness(0.8) }
            .background { self.foregroundColor(color2).blur(radius: 1).brightness(0.35) }
            .background { self.foregroundColor(color3).blur(radius: 5).brightness(0.35) }
    }
}

