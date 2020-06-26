//
//  ViewController.swift
//  Collabr
//
//  Created by Harshita Daddala on 4/29/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import UIKit

class EventSummaryViewController: UIViewController {

	@IBOutlet weak var eventSegmentControl: UISegmentedControl!
	@IBOutlet weak var eventSummaryTableView: UITableView!
	
	var eventsToLoad: [Event]?
	
	var selectedEvent: Event?
	
	var eventManager = EventManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		loadEventSummaryView(with: DataSingleton.events)
		
		eventManager.delegate = self
		
		eventSummaryTableView.register(UINib(nibName: K.CellIdentifiers.eventSummaryCell, bundle: nil), forCellReuseIdentifier: K.CellIdentifiers.eventSummaryCell)
		eventSummaryTableView.dataSource = self
		eventSummaryTableView.delegate = self
		eventSummaryTableView.reloadData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		eventSummaryTableView.reloadData()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		eventSummaryTableView.reloadData()
	}

	@IBAction func plusBtnPressed(_ sender: UIButton) {
		self.performSegue(withIdentifier: K.Segues.eventSummaryToEventCreate, sender: self)
	}
	
}

extension EventSummaryViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return eventsToLoad?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.eventSummaryCell, for: indexPath) as! EventSummaryCell
		
		let eventSummary = eventsToLoad![indexPath.row]
		
		cell.eventTitleLabel.text = eventSummary.title
		cell.rsvpSummaryView.setRSVPData(event: eventSummary)
		cell.eventTimeLabel.text = K.Formats.getTimeLabelStyle1(for: eventSummary.fromDate)
		
		return cell
	}
}

extension EventSummaryViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		selectedEvent = eventsToLoad?[indexPath.row]
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		//go to event detail view
		performSegue(withIdentifier: K.Segues.eventSummaryToEventDetail, sender: self)
	}
}

//MARK: - Prepare for Segue

extension EventSummaryViewController {
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// check for segues identifier
		
		if segue.identifier == K.Segues.eventSummaryToEventDetail {
			let destinationVC = segue.destination as! EventDetailViewController
			destinationVC.event = selectedEvent
		} else if segue.identifier == K.Segues.eventSummaryToEventCreate {
			let destinationVC = segue.destination as! CreateEventViewController
			destinationVC.eventManager = eventManager
		}
	}
}

//MARK: - Segment Control
//
//extension EventSummaryViewController {
//	@objc func segmentedControlValueChanged(segment: UISegmentedControl){
//		eventsUpcoming.append(contentsOf: DataSingleton.events)
//		eventSummaryTableView.reloadData()
//	}
//}

//MARK: - Event Manager Delegate

extension EventSummaryViewController: EventManagerDelegate {
	
	func didUpdateEvents(_ eventManager: EventManager, event: Event) {
		loadEventSummaryView(with: DataSingleton.events)
	}
}

//MARK: - Data Methods

extension EventSummaryViewController {
	func loadEventSummaryView(with events: [Event]?){
		
		//TODO: if events count is 0, show "No Events Placeholder"
		
		eventsToLoad = events
		eventSummaryTableView.reloadData()
	}
}
