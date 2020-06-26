//
//  EventManager.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/10/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import Foundation

protocol EventManagerDelegate {
	func didUpdateEvents(_ eventManager: EventManager, event: Event)
}

struct EventManager {
	
	var delegate: EventManagerDelegate?
	
	func addNewEvent(id: UUID, title: String, description: String, createdBy: User, fromDate: Date){
		
		var event = Event(id: id, title: title, description: description, userCreatedBy: createdBy, fromDate: fromDate)
		
		var invite = Invite(user: createdBy, event: event)
		invite.isHost = true
		invite.response = .GOING
		
		event.invitees.append(invite)
		
		DataSingleton.events.append(event)
		
		delegate?.didUpdateEvents(self, event: event)
	}
}

//MARK: - Static Functions

extension EventManager {
	
	static func getNumOfInvitees(for event: Event, _ responseType: Response?) -> Int{
		
		if let response = responseType {
			let list = event.invitees.filter { (invite) -> Bool in
				invite.response == response
			}
			return list.count
		}
		
		return event.invitees.count
	}
}
