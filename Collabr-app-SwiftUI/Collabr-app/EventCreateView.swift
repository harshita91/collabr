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
        
		EventFormContentView()
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
	
	@State private var eventTitle: String = ""
	@State private var eventDescription: String = ""
	@State private var eventDate = Date()
	@State private var eventTimeStart = ""
	@State private var eventTimeEnd = ""
	@State private var eventLocation: String = ""
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
						.foregroundColor(Color.textColorPrimary)
						.font(Font.primaryIconFont)
				}
			}
			
			VStack(alignment:.leading, spacing: 40){
				HStack{
					Button("Start Date"){
					}
						.font(Font.primaryBodyFont)
						.foregroundColor(Color.textColorBtnLink)
						.frame(alignment: .center)
					
					Spacer()
					
					Button("End Date"){
					}
						.font(Font.primaryBodyFont)
						.foregroundColor(Color.textColorBtnLink)
						.frame(alignment: .center)
				}
				
				Button("Add Location"){
				}
					.font(Font.primaryBodyFont)
					.foregroundColor(Color.textColorBtnLink)
					.frame(alignment: .center)
				
				Button("Upload Event Picture"){
				}
					.font(Font.primaryBodyFont)
					.foregroundColor(Color.textColorBtnLink)
					.frame(alignment: .center)
				
				TextField("Description", text: $eventDescription)
					.font(Font.primaryBodyFont)
			}
			
			Button("Create Event"){
			}
				.font(Font.primaryBodyFont)
				.foregroundColor(Color.textColorPrimary)
				.frame(alignment: .center)
			
			Spacer()
							
		}
		.padding(30)
	}
}

#if DEBUG
struct EventCreateView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreateView()
    }
}
#endif
