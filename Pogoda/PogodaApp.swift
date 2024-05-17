//
//  PogodaApp.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 28/11/2023.
//

import SwiftUI

@main
struct PogodaApp: App {
    let vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
