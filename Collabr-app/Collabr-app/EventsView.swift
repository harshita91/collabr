//
//  EventsView.swift
//  Collabr-app
//
//  Created by Harshita Daddala on 1/13/20.
//  Copyright © 2020 Collabr. All rights reserved.
//

import Foundation
import SwiftUI

struct EventsView: View {
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0){
            
            HStack {
                Text("Events")
                    .font(Font.titleFont)
                    .foregroundColor(Color.primaryTextColor)
                
                Spacer()
                
                Button(action: {
                    //TODO: Add create event here
                    print("Edit button was tapped")
                }) {
                    Image(systemName: "plus.circle")
                    .foregroundColor(Color.primaryTextColor)
                    .font(Font.system(size: 50, weight: .ultraLight))
                }
            }.padding()
            
            EventCardView().padding()
            
            Spacer()
        }
    }
}

#if DEBUG
struct EventsView_Previews : PreviewProvider {
    static var previews : some View {
        EventsView()
    }
}
#endif
