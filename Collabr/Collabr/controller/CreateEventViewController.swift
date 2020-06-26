//
//  CreateEventViewController.swift
//  Collabr
//
//  Created by Harshita Daddala on 4/29/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
	
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var createEventBtn: UIButton!
	
	@IBOutlet weak var fromDateTextField: UITextField!
	
	var fromDate: Date = Date(timeIntervalSinceNow: 0.0)
	
	let datePicker = UIDatePicker()
	
	var eventManager: EventManager?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		// hide date picker
//		datePicker.isHidden = true
		
		fromDateTextField.delegate = self
	}
	
	@IBAction func dismissBtnPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func addLocationBtnPressed(_ sender: UIButton) {
	}
	
	@IBAction func createEventBtnPressed(_ sender: UIButton) {
		
		let eventTitle = titleTextField.text!
		let eventDescription = descriptionTextView.text!
		let uuid = UUID()
		
		if let createdBy = DataSingleton.currentUser {
			
			eventManager?.addNewEvent(id: uuid, title: eventTitle, description: eventDescription, createdBy: createdBy, fromDate: fromDate)
			
			self.dismiss(animated: true, completion: nil)
		}
		else{
			print("No current user for session")
		}
	}
}

extension CreateEventViewController: UITextFieldDelegate {
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		
		if textField.tag == 0 {
			showDatePicker()
		}
		
		return true
	}
}

//MARK: - Date Picker Methods

extension CreateEventViewController {
	func showDatePicker() {
		
		datePicker.datePickerMode = .dateAndTime
		
		//ToolBar
		let toolbar = UIToolbar();
		toolbar.sizeToFit()
		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(datePickerDoneBtnPressed));
		let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(datePickerCancelBtnPressed));
		
		toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
		
		fromDateTextField.inputAccessoryView = toolbar
		fromDateTextField.inputView = datePicker
	}
	
	@objc func datePickerDoneBtnPressed(){
		
		fromDate = datePicker.date
		
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, h:mm a"
		fromDateTextField.text = formatter.string(from: datePicker.date)
		self.view.endEditing(true)
	}
	
	@objc func datePickerCancelBtnPressed(){
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, h:mm a"
		fromDateTextField.text = formatter.string(from: fromDate)
		self.view.endEditing(true)
	}
}
