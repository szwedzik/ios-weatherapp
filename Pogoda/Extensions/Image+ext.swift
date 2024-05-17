//
//  Image+ext.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 05/12/2023.
//

import Foundation
import SwiftUI


extension Image {
    func iconStyle(width: CGFloat = 40, height: CGFloat = 40) -> some View {
        renderingMode(.original)
            .size(width: width, height: height)
    }
    
    func templateStyle(width: CGFloat = 40, height: CGFloat = 40, color: Color = .white, opacity: Double = 1.0) -> some View {
        renderingMode(.template)
            .size(width: width, height: height)
            .foregroundStyle(color)
            .opacity(opacity)
    }
    
    func buttonStyle() -> some View {
        templateStyle(width: 20, height: 20)
    }
    
    private func size(width: CGFloat, height: CGFloat) -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
    
}
