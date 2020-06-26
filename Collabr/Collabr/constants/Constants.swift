//
//  Constants.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/4/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import Foundation

struct K {
	
	struct CellIdentifiers {
		static let eventSummaryCell = "EventSummaryCell"
	}
	
	struct Segues {
		static let eventSummaryToEventCreate = "eventSummaryToEventCreate"
		static let eventSummaryToEventDetail = "eventSummaryToEventDetail"
	}
	
	struct Formats {
		/**
			Yesterday @ xx pm
			Today @ xx pm
			Tomorrow @xx pm
			Wednesday, March 12 @ xx pm
		*/
		static func getTimeLabelStyle1(for dateTime: Date) -> String{
			
			var timeLabel = ""
			
			//currentDate
			let calendar = Calendar.current
			let timeComponents = calendar.dateComponents([.hour, .minute], from: dateTime)
			
			let minute = timeComponents.minute!
			
			let dateFormatter = DateFormatter()
			
			// do not want to show minutes if it's 0
			if minute == 0 {
				dateFormatter.dateFormat = "h a"
			} else {
				dateFormatter.dateFormat = "h:mm a"
			}
			
			let timeString = dateFormatter.string(from: dateTime)
			
			// Today @ 11pm
			if  calendar.isDateInToday(dateTime) {
				timeLabel = "Today @ \(timeString)"
				return timeLabel
			}
			
			// Tomorrow @ 12pm
			if calendar.isDateInTomorrow(dateTime) {
				timeLabel = "Tomorrow @ \(timeString)"
				return timeLabel
			}
			
			if calendar.isDateInYesterday(dateTime) {
				timeLabel = "Yesterday @ \(timeString)"
				return timeLabel
			}
			
			// Monday, May 30th @ 5:10pm
			dateFormatter.dateFormat = "EEEE, MMM d"
			let dateString = dateFormatter.string(from: dateTime)
			timeLabel = "\(dateString) @ \(timeString)"
			
			return timeLabel
		}
	}
}
