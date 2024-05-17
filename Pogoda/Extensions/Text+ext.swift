//
//  Text+ext.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 05/12/2023.
//

import Foundation
import SwiftUI

extension Text {
    
    func defaultStyle(size: CGFloat = 18, color: Color = .white) -> some View {
        font(.system(size: size, weight: .medium))
            .foregroundStyle(color)
            .padding(2)
    }
}
