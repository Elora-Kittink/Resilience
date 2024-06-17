//
//  Plant.swift
//  Resilience
//
//  Created by Elora on 17/06/2024.
//

import Foundation

struct Plant {
	
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
}

enum MockDatas {
	static let zone1 = Zone(id: "zone1", name: "Jardin de devant", description: "Zone principale près de l'entrée")
	static let zone2 = Zone(id: "zone2", name: "Verger", description: "Zone des arbres fruitiers")
	static let zone3 = Zone(id: "zone3", name: "Carré potager 8", description: "Carré potager dédié aux légumes racines")
	static let zone4 = Zone(id: "zone4", name: "Parterre de fleurs", description: "Zone dédiée aux fleurs colorées")
	static let zone5 = Zone(id: "zone5", name: "Jardin d'aromates", description: "Zone pour les plantes aromatiques")
	static let zone6 = Zone(id: "zone6", name: "Potager", description: "Zone des légumes")
	static let zone7 = Zone(id: "zone7", name: "Zone des plantes médicinales", description: "Zone pour les plantes médicinales")
	static let zone8 = Zone(id: "zone8", name: "Verger", description: "Zone des arbres fruitiers")
	static let zone9 = Zone(id: "zone9", name: "Zone des petits fruits", description: "Zone pour les petits fruits")
	static let zone10 = Zone(id: "zone10", name: "Zone des vignes", description: "Zone pour les vignes")
	
	static let plants: [Plant] = [
		Plant(
			id: "1",
			zone: zone1,
			genre: "Pommier",
			variety: "Golden",
			description: "Pommier à fruits jaunes",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 10, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 5, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 6, to: Date()),
			hardiness: -20,
			notes: "Porte-greffe : M9"
		),
		Plant(
			id: "2",
			zone: zone2,
			genre: "Poirier",
			variety: "Williams",
			description: "Poirier à fruits sucrés",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 8, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 4, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 5, to: Date()),
			hardiness: -25,
			notes: "Porte-greffe : BA29"
		),
		Plant(
			id: "3",
			zone: zone3,
			genre: "Carotte",
			variety: "Nantaise",
			description: "Carotte de type Nantaise",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 7, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 3, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 4, to: Date()),
			hardiness: -10,
			notes: "Bien arroser"
		),
		Plant(
			id: "4",
			zone: zone4,
			genre: "Tulipe",
			variety: "Triomphe",
			description: "Tulipe de type Triomphe",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 12, to: Date()),
			fruitingStart: nil,
			fruitingEnd: nil,
			hardiness: -15,
			notes: "Protéger du gel"
		),
		Plant(
			id: "5",
			zone: zone5,
			genre: "Basilic",
			variety: "Genovese",
			description: "Basilic à grandes feuilles",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 6, to: Date()),
			fruitingStart: nil,
			fruitingEnd: nil,
			hardiness: 0,
			notes: "Semer tous les 15 jours pour récoltes successives"
		),
		Plant(
			id: "6",
			zone: zone6,
			genre: "Tomate",
			variety: "Marmande",
			description: "Tomate charnue et savoureuse",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 10, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 4, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 5, to: Date()),
			hardiness: 2,
			notes: "Pailler pour conserver l'humidité"
		),
		Plant(
			id: "7",
			zone: zone7,
			genre: "Camomille",
			variety: "Allemande",
			description: "Plante utilisée pour les infusions",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 15, to: Date()),
			fruitingStart: nil,
			fruitingEnd: nil,
			hardiness: -15,
			notes: "Récolter les fleurs dès qu'elles s'ouvrent"
		),
		Plant(
			id: "8",
			zone: zone8,
			genre: "Ceriser",
			variety: "Bigarreau",
			description: "Cerises rouges et sucrées",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 12, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 5, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 6, to: Date()),
			hardiness: -20,
			notes: "Tailler après la récolte"
		),
		Plant(
			id: "9",
			zone: zone9,
			genre: "Framboisier",
			variety: "Heritage",
			description: "Framboises remontantes",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 7, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 4, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 10, to: Date()),
			hardiness: -25,
			notes: "Récolter tous les deux jours"
		),
		Plant(
			id: "10",
			zone: zone10,
			genre: "Vigne",
			variety: "Chasselas",
			description: "Raisin blanc",
			bloomingStart: Date(),
			bloomingEnd: Calendar.current.date(byAdding: .day, value: 10, to: Date()),
			fruitingStart: Calendar.current.date(byAdding: .month, value: 7, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .month, value: 8, to: Date()),
			hardiness: -18,
			notes: "Tailler en hiver"
		)
	]
}







