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
	let bloomingStart: Date?
	let bloomingEnd: Date?
	let fruitingStart: Date?
	let fruitingEnd: Date?
//	let multiplicationMethods: [MultiplicationMethod]
//	let multiplicationDates: [Date]
	let hardiness: Int?
	let notes: String?
//	let quantity: Int
	
	var isInBloom: Bool {
		guard let bloomingStart = bloomingStart, let bloomingEnd = bloomingEnd else {
			return false
		}
		let today = Date()
		return today >= bloomingStart && today <= bloomingEnd
	}
	
	var isInFruiting: Bool {
		guard let fruitingStart = fruitingStart, let fruitingEnd = fruitingEnd else {
			return false
		}
		let today = Date()
		return today >= fruitingStart && today <= fruitingEnd
	}
}


