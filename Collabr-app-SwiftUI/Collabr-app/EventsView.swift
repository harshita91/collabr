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
    
    @State private var createEvent: Bool = false
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0){
            
            HStack {
                Text("Events")
                    .font(Font.titleFont)
                    .foregroundColor(Color.textColorPrimary)
                
                Spacer()
                
                Button(action: {
                    //TODO: Add create event here
                    self.createEvent = true
                    
                }) {
                    Image(systemName: "plus.circle")
                    .foregroundColor(Color.textColorPrimary)
                        .font(Font.primaryIconFont)
                }.sheet(isPresented: self.$createEvent){
                    EventCreateView()
                }
                
            }.padding()
            
            EventSummaryView()
            
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
