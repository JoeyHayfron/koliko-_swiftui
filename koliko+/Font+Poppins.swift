import SwiftUI

extension Font {
    static func poppins(_ weight: PoppinsWeight, size: CGFloat = 16) -> Font {
        return .custom(weight.rawValue, size: size)
    }
    
    enum PoppinsWeight: String {
        case regular = "Poppins-Regular"
        case bold = "Poppins-Bold"
        case semibold = "Poppins-SemiBold"
    }
}
