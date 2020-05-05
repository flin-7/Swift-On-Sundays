//
//  ContentHeaderView.swift
//  HuliPizza
//
//  Created by Felix Lin on 5/3/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Surf Board")
                    .resizable()
                    .scaledToFit()
                Text("Huli Pizza Company")
                    .font(.title)
            }
            Text("Order pizza")
                .font(.largeTitle)
        }
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}
