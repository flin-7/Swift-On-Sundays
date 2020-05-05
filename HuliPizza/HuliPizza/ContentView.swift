//
//  ContentView.swift
//  HuliPizza
//
//  Created by Felix Lin on 4/10/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ContentHeaderView()
            MenuListView()
            OrderListView()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .colorScheme(.dark)
                .background(Color.black)
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
