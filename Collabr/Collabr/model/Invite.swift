//
//  Invite.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/10/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import Foundation

struct Invite {
	let user: User
	let event: Event
	var response: Response = .NO_RESPONSE
	var isHost: Bool = false
}

enum Response {
	case GOING, MAYBE, NOT_GOING, NO_RESPONSE
}
