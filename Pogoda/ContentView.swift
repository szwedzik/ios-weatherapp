//
//  ContentView.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(systemName: "location")
                        .buttonStyle()
                        .onTapGesture {
                            vm.refreshDataWithLocation()
                        }
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .buttonStyle()
                        .onTapGesture {
                            vm.showSettings = true
                        }
                }
                .padding()
                Text(vm.city)
                    .defaultStyle(size: 32)
                Spacer()
                if let currentForecast = vm.forecast {
                    Image(systemName: currentForecast.icon)
                        .iconStyle(width: 200, height: 200)
                    Text(currentForecast.description)
                        .defaultStyle(size: 32)
                    HStack(spacing: 32) {
                        Text(currentForecast.temperature)
                            .defaultStyle(size: 16)
                        Text(currentForecast.pressure)
                            .defaultStyle(size: 16)
                    }
                }
                Spacer()
                LazyHStack {
                    ForEach(vm.nextDaysForecasts, id: \.date) { e in
                        VStack {
                            Image(systemName: e.icon)
                                .iconStyle(width: 32, height: 32)
                            Text(e.date)
                                .defaultStyle(size: 16)
                            Text(e.temperature)
                                .defaultStyle(size: 16)
                        }
                    }
                }
            }
            .sheet(isPresented: $vm.showSettings, content: {
                Settings()
            })
            .onAppear {
                vm.refreshData()
            }
            .padding()
        }
    }
}

struct ContentViewPreview : PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }

}

//#Preview {
//    ContentView()
//}
