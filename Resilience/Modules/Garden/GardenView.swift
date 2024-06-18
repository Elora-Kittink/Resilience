//  GardenViewController.swift
//
//  Created by Elora on 17/06/2024.
//

import SwiftUI

struct GardenView: View {
	
	// MARK: - Variables
	private let interactor = GardenInteractor()
	
	// MARK: State
	@ObservedObject var viewModel: GardenViewModel
	
	var body: some View {
		VStack {
			Text("Garden view")
			List(self.viewModel.plants) { plant in
				HStack {
					Text("\(plant.genre) \(plant.variety ?? "") - \(plant.zone.name)")
					Spacer()
					if plant.isInBloom {
						Image(systemName: "camera.macro")
							.foregroundColor(.pink)
					} else if plant.isInFruiting {
						Image(systemName: "apple.logo")
							.foregroundColor(.green)
					}
				}
				
			}
			Button(action: {
				print("Bouton + appuyé")
			}) {
				Image(systemName: "plus")
					.resizable()
					.frame(width: 20, height: 20)
					.padding()
			}
		}
	}
}




#Preview {
	GardenView(viewModel: GardenViewModel())
}

//class GardenViewController: BaseViewController
//<
//	GardenViewModel,
//	GardenPresenter,
//	GardenInteractor
//> {
//	
//	// MARK: - Outlets
//	
//	// MARK: - Variables
//	
//	// MARK: - View life cycle
//	override func viewDidLoad() {
//		super.viewDidLoad()
//	}
//	
//	// MARK: - Refresh
//	override func refreshUI() {
//		super.refreshUI()
//	}
//
//	// MARK: - Actions
//}
