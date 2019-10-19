//
//  InfoView.swift
//  FelixCard
//
//  Created by Felix Lin on 10/19/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                
                Text(text)
                .foregroundColor(Color("Info Color"))
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "+1 123 456 7890", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
