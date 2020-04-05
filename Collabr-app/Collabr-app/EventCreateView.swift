//
//  SwiftUIView.swift
//  Collabr-app
//
//  Created by Harshita Daddala on 1/13/20.
//  Copyright © 2020 Collabr. All rights reserved.
//

import Foundation
import SwiftUI

struct EventCreateView: View {
    
    var body: some View {
        
		Form {
			EventFormContentView()
		}
    }
}

struct EventFormContentView : View {
	
	@Environment(\.presentationMode) var presentationMode
	
	@State private var createEvent1: Bool = false
//
//	@State private var eventTitle: String = ""
//	@State private var eventDescription: String = ""
//	@State private var eventDate = Date()
//	@State private var eventTimeStart = Date()
//	@State private var eventTimeEnd = Date()
//	@State private var eventLocation: String = ""
//	@State private var eventImage: String = ""
	
	@State private var eventTitle = ""
	@State private var eventDescription = ""
	@State private var eventDate = Date()
	@State private var eventTimeStart = ""
	@State private var eventTimeEnd = ""
	@State private var eventLocation = ""
	@State private var eventImage = ""
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 60) {

			HStack{
				TextField("Event Title", text: $eventTitle)
					.font(Font.titleFont)
				
				Spacer()
				
				// dismisses the action sheet
				Button(action: {
					self.presentationMode.wrappedValue.dismiss()
				}) {
					Image(systemName: "multiply")
						.foregroundColor(Color.primaryTextColor)
						.font(Font.primaryIconFont)
				}
			}
			
			VStack(spacing: 40){
				HStack{
	//					TextField("Date", text: $eventTimeStart)
	//						.font(Font.primaryBodyFont)
					DatePicker(selection: $eventDate){
						Text("Pick a date")
					}
					
					TextField("Start Time", text: $eventTimeStart)
						.font(Font.primaryBodyFont)
					TextField("End Time", text: $eventTimeEnd)
						.font(Font.primaryBodyFont)
				}
				
				TextField("Add Location", text: $eventLocation)
					.font(Font.primaryBodyFont)
				
				TextField("Upload Event Picture", text: $eventImage)
					.font(Font.primaryBodyFont)
				
				TextField("Description", text: $eventDescription)
					.font(Font.primaryBodyFont)
			}
			
			Button("Create Event"){
				}
				.font(Font.primaryBodyFont)
				.foregroundColor(Color.primaryTextColor)
				.frame(alignment: .center)
			
			Spacer()
							
		}
		.padding(.horizontal, 15)
		
	}
}

#if DEBUG
struct EventCreateView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreateView()
    }
}
#endif
