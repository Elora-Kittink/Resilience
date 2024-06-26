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
	let bloomingPeriod: (start: Date, end: Date)?
	let fruitingPeriod: (start: Date, end: Date)?
//	let multiplicationMethods: [MultiplicationMethod]
//	let multiplicationDates: [Date]
	let hardiness: Int?
	let notes: String?
//	let quantity: Int
	
	var isInBloom: Bool {
		guard let bloomingPeriod = bloomingPeriod else { return false }
		let today = Date()
		return today >= bloomingPeriod.start && today <= bloomingPeriod.end
	}
	
	var isInFruiting: Bool {
		guard let fruitingPeriod = fruitingPeriod else { return false }
		let today = Date()
		return today >= fruitingPeriod.start && today <= fruitingPeriod.end
	}
}


