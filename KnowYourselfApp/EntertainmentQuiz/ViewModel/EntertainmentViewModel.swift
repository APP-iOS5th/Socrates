//
//  EntertainmentViewModel.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/11/24.
//

import Foundation
import Combine

class EntertainmentViewModel: ObservableObject {
    @Published var entertainmentData: [EntertainmentModel] = []
    @Published var isLoading: Bool = false
    
    
    private var cancellable: Cancellable?
    private let actorService = EntertainmentServer()
    
    func fetchActorData() {
        isLoading = true
        
        cancellable = actorService.fetchActorData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] data in
                self?.entertainmentData = data
            })
    }
}
