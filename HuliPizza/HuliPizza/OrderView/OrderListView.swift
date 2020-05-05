//
//  OrderListView.swift
//  HuliPizza
//
//  Created by Felix Lin on 5/3/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    var body: some View {
        VStack {
            Text("Your Order")
            List(0 ..< 5) { item in
                HStack(alignment: .firstTextBaseline) {
                    Text("Your order item here")
                    Spacer()
                    Text("$0.00")
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
