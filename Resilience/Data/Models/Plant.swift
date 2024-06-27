//
//  Plant.swift
//  Resilience
//
//  Created by Elora on 17/06/2024.
//

import Foundation

struct Plant: Identifiable {
	
	let id: String
	let zone: Zone
//	let type: PlantType
	let genre: String
	let variety: String?
	let description: String?
	let bloomingPeriods: [(start: Date, end: Date)]?
	let fruitingPeriods: [(start: Date, end: Date)]?
//	let multiplicationMethods: [MultiplicationMethod]
//	let multiplicationDates: [Date]
	let hardiness: Int?
	let notes: String?
//	let quantity: Int
	
	var isInBloom: Bool {
		guard let bloomingPeriods = bloomingPeriods else { return false }
		let today = Date()
		for period in bloomingPeriods {
			if today >= period.start && today <= period.end {
				return true
			}
		}
		return false
	}
	
	var isInFruiting: Bool {
		guard let fruitingPeriods = fruitingPeriods else { return false }
		let today = Date()
		for period in fruitingPeriods {
			if today >= period.start && today <= period.end {
				return true
			}
		}
		return false
	}
}
