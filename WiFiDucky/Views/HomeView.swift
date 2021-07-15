//
//  HomeView.swift
//  WiFiDucky
//
//  Created by Huxley McGuffin on 15/7/21.
//

import SwiftUI
import SystemConfiguration.CaptiveNetwork


struct HomeView: View {
    
    @State var name: String = ""
    @State var ssid: String = ""
    @State var password: String = ""
    private let color: Color = Color.random
    
    private var qrString: String {
        "WIFI:T:WPA;S:\(ssid);P:\(password);;"
    }
    
    private var networkName: String {
        name.isEmpty ? "Network" : name
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("WiFi Ducky 🦆")
                    .font(.title)
                    .bold()
            }
            Spacer()
            VStack {
                TextField("Name", text: $name)
                    .accessibilityLabel(Text("Network Name"))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                TextField("SSID", text: $ssid)
                    .accessibilityLabel(Text("Network SSID"))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                TextField("Password", text: $password)
                    .accessibilityLabel(Text("Network Password"))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }

            Spacer()
            NavigationLink(destination: GenerateView(qrString: qrString, name: networkName)) {
                Text("Generate")
                    .bold()
                    .font(.headline)
            }
            .accessibilityLabel(Text("Generate QR Code for \(networkName)"))
            .disabled(ssid.isEmpty || password.isEmpty)
            .foregroundColor((ssid.isEmpty || password.isEmpty) ? .gray : /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
