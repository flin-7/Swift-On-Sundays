//
//  DetailView.swift
//  HackerNews
//
//  Created by Felix Lin on 11/22/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
