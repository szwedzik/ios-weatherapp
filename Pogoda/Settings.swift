//
//  Settings.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 19/12/2023.
//

import SwiftUI

struct Settings: View {
    @State var city: String = "Warszawa"
    var body: some View {
        
        TextField("Miasto", text: $city)
        VStack {
            
        }
    }
}

#Preview {
    Settings()
}
