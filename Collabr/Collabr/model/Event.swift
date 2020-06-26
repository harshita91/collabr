//
//  Event.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/4/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import Foundation



struct Event {
	let id: UUID
	
	let title: String
	let description: String
	
	let userCreatedBy: User
	
	let fromDate: Date
	
	var invitees = [Invite]()
}
