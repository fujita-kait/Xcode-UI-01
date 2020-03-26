//
//  ContentView.swift
//  UI-01
//
//  Created by 藤田 on 2020/02/25.
//  Copyright © 2020 KAIT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var myIp = "192.168.50.12"
    var ips = ["192.168.150.112", "192.168.50.15", "192.168.50.20", "192.168.50.30"]
    var eojs = ["013001", "013002", "0EF001"]
    var esvs = ["61", "62", "72"]
    var epcs = ["80", "A0", "B0"]
    var edts = ["30"]
    @State private var ipSelection = 2
    @State private var eojSelection = 0
    @State private var esvSelection = 0
    @State private var epcSelection = 0
    @State private var edtSelection = 0
    var body: some View {
        GeometryReader { geometry in
        VStack {
            HStack {
                Text("  ")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("SEND  ").font(.title)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("SEARCH  ").font(.title)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("CLEAR IP  ").font(.title)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("SPOT").font(.title)
                }
                Spacer()
                Text(self.myIp).font(.headline)
                Text("  ")
            }.padding()
            HStack {
                VStack(spacing: 5) {
                    Text("IP").font(.headline)
                    Picker(selection: self.$ipSelection, label: Text("Label")) {
                        ForEach(0 ..< self.ips.count) {
                            Text(self.ips[$0]).font(.title)
                        }
                    }
                    .labelsHidden().frame(width: geometry.size.width * (2/8), height: 100).clipped()
                    .onReceive([self.ipSelection].publisher.first()) { (value) in
                        print("ipSelection: \(value)")}
                    Text("Selection: \(self.ipSelection)")
                }
                VStack(spacing: 5) {
                    Text("EOJ").font(.headline)
                    Picker(selection: self.$eojSelection, label: Text("Label")) {
                        ForEach(0 ..< self.eojs.count) {
                            Text(self.eojs[$0]).font(.title)
                        }
                    }
                    .labelsHidden().frame(width: geometry.size.width * (2/8), height: 100).clipped()
                    Text("Selection: \(self.eojSelection)")
                }
                VStack(spacing: 5) {
                    Text("ESV").font(.headline)
                    Picker(selection: self.$esvSelection, label: Text("Label")) {
                        ForEach(0 ..< self.esvs.count) {
                            Text(self.esvs[$0]).font(.title)
                        }
                    }
                    .labelsHidden().frame(width: geometry.size.width * (1/8), height: 100).clipped()
                    Text("Selection: \(self.esvSelection)")
                }
                VStack(spacing: 5) {
                    Text("EPC").font(.headline)
                    Picker(selection: self.$epcSelection, label: Text("Label")) {
                        ForEach(0 ..< self.epcs.count) {
                            Text(self.epcs[$0]).font(.title)
                        }
                    }
                    .labelsHidden().frame(width: geometry.size.width * (1/8), height: 100).clipped()
                    Text("Selection: \(self.epcSelection)")
                }
                VStack(spacing: 5) {
                    Text("EDT").font(.headline)
                    Picker(selection: self.$edtSelection, label: Text("Label")) {
                        ForEach(0 ..< self.edts.count) {
                            Text(self.edts[$0]).font(.title)
                        }
                    }
                    .labelsHidden().frame(width: geometry.size.width * (2/8), height: 100).clipped()
                    Text("Selection: \(self.edtSelection)")
                }
            }
            List{
                Text("Sent Data")
                Text("Received from")
                Text("Received Data")
            }
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        return ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
