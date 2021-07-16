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
    @State var isPresented: Bool = false
    private let color: Color = Color.random
    
    private var qrString: String {
        "WIFI:T:WPA;S:\(ssid);P:\(password);;"
    }
    
    private var networkName: String {
        name.isEmpty ? "Network" : name
    }
    
    private var canGenerate: Bool {
        if ssid.isEmpty || ssid.count < 3 {
            return false
        }
        if password.isEmpty || password.count < 8 {
            return false
        }
        
        return true
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
            Button("Generate") {
                isPresented = true
            }
            .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
            .accessibilityLabel(Text("Generate QR Code for \(networkName)"))
            .disabled(!canGenerate)
            .foregroundColor(!canGenerate ? .gray : /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
        }
        .sheet(isPresented: $isPresented, content: {
            NavigationView {
                GenerateView(qrString: qrString, name: networkName)
                    .navigationBarItems(trailing: Button(action: {
                        isPresented = false
                    }) {
                        ZStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(.gray)
                                .font(Font.title.weight(.bold))
                                
                            Circle()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.gray)
                                .opacity(0.13)
                        }
                        .accessibilityLabel(Text("Close generate"))
                    })
            }
            
        })
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isPresented: true)
    }
}
