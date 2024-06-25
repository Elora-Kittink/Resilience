//
//  MockDatas.swift
//  Resilience
//
//  Created by Elora on 18/06/2024.
//

import Foundation

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
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 15)),
			hardiness: -20,
			notes: "Porte-greffe : M9"
		),
		Plant(
			id: "2",
			zone: zone2,
			genre: "Poirier",
			variety: "Williams",
			description: "Poirier à fruits sucrés",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 15)),
			hardiness: -25,
			notes: "Porte-greffe : BA29"
		),
		Plant(
			id: "3",
			zone: zone3,
			genre: "Carotte",
			variety: "Nantaise",
			description: "Carotte de type Nantaise",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15)),
			hardiness: -10,
			notes: "Bien arroser"
		),
		Plant(
			id: "4",
			zone: zone4,
			genre: "Tulipe",
			variety: "Triomphe",
			description: "Tulipe de type Triomphe",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15)),
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
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 15)),
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
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 15)),
			hardiness: 2,
			notes: "Pailler pour conserver l'humidité"
		),
		Plant(
			id: "7",
			zone: zone7,
			genre: "Camomille",
			variety: "Allemande",
			description: "Plante utilisée pour les infusions",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 15)),
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
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 15)),
			hardiness: -20,
			notes: "Tailler après la récolte"
		),
		Plant(
			id: "9",
			zone: zone9,
			genre: "Framboisier",
			variety: "Heritage",
			description: "Framboises remontantes",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 15)),
			hardiness: -25,
			notes: "Récolter tous les deux jours"
		),
		Plant(
			id: "10",
			zone: zone10,
			genre: "Vigne",
			variety: "Chasselas",
			description: "Raisin blanc",
			bloomingStart: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 1)),
			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 15)),
			fruitingStart: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1)),
			fruitingEnd: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 15)),
			hardiness: -18,
			notes: "Tailler en hiver"
		),
//		Plant(
//			id: "11",
//			zone: zone1,
//			genre: "Fleur éternelle",
//			variety: "Infinita",
//			description: "Un arbre en fleur toute l'année",
//			bloomingStart: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)),
//			bloomingEnd: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31)),
//			fruitingStart: nil,
//			fruitingEnd: nil,
//			hardiness: 0,
//			notes: "Toujours en fleur"
//		),
		Plant(
			id: "12",
			zone: zone2,
			genre: "Arbre fruitier magique",
			variety: "Fructus Perpetuus",
			description: "Un arbre en fructification toute l'année",
			bloomingStart: nil,
			bloomingEnd: nil,
			fruitingStart: Calendar.current.date(byAdding: .year, value: -1, to: Date()),
			fruitingEnd: Calendar.current.date(byAdding: .year, value: 1, to: Date()),
			hardiness: 0,
			notes: "Toujours en fruit"
		)
	]
	
	static let tasks: [TodoTask] = [
		TodoTask(id: "59765", name: "Planter les tomates", isCompleted: false, priority: .high),
		TodoTask(id: "3987", name: "Arroser les fleurs", isCompleted: false, priority: .normal),
		TodoTask(id: "86579", name: "Tailler les arbres", isCompleted: true, priority: .medium),
		TodoTask(id: "9768", name: "Nettoyer les outils de jardin", isCompleted: false, priority: .normal),
		TodoTask(id: "97687", name: "Récolter les pommes", isCompleted: true, priority: .medium),
		TodoTask(id: "978968", name: "Préparer le compost", isCompleted: false, priority: .high)
	]
}
