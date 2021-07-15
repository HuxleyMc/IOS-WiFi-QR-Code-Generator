//
//  HomeView.swift
//  WiFiDucky
//
//  Created by Huxley McGuffin on 15/7/21.
//

import SwiftUI
import SystemConfiguration.CaptiveNetwork

struct WiFiInfo {
    var rssi: String
    var networkName: String
    var macAddress: String
}

struct HomeView: View {
    
    @State var ssid: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("WiFi Ducky")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
