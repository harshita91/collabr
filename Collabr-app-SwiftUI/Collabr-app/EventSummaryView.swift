//
//  SwiftUIView.swift
//  Collabr-app
//
//  Created by Harshita Daddala on 1/13/20.
//  Copyright © 2020 Collabr. All rights reserved.
//

import SwiftUI

struct EventSummaryView: View {
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            PickerSelectionView()
            
            VStack(alignment: .leading, spacing: 10){
                Text("Tomorrow @ 8pm")
                    .font(Font.secondaryBodyFont)
                    .foregroundColor(Color.textColorSecondary)
                    .multilineTextAlignment(.leading)
                
                CardContentView()
            }
        }
    }
}

struct PickerSelectionView: View {
    
    @State private var eventType = 0
    
    var body : some View {
        Picker(selection: $eventType, label: Text("What is your favorite color?")) {
            Text("Upcoming").tag(0)
            Text("Past").tag(1)
        }.pickerStyle(SegmentedPickerStyle())
            .padding(5)
    }
}

struct CardContentView: View {
    
    var body : some View {
        
        VStack(alignment: .leading){
            
            //Event title
            Text("Potluck @ Harshi's")
                .font(Font.primaryBodyFont)
                .foregroundColor(Color.textColorPrimary)
            
            //Secondary information for the event
            SecondaryContentView()
            
        }.padding()
            .background(Color.bgColorSecondary)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.borderColor, lineWidth: 0)
            )
            .shadow(radius: 3)
        
    }
}

struct SecondaryContentView: View {
    
    var body : some View {
        
        HStack {
            Text("RSVP")
                .font(Font.secondaryBodyFont)
                .foregroundColor(Color.textColorSecondary)
            
            Spacer()
            
            //TODO: should change to a maps link
            Text("Directions")
                .font(Font.secondaryBodyFont)
                .foregroundColor(Color.textColorSecondary)
        }
    }
}

#if DEBUG
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventSummaryView()
    }
}
#endif
