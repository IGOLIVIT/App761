//
//  ParticipantsViewModel.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI
import CoreData

final class ParticipantsViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isData: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var photos: [String] = ["g1", "g2", "g3", "m1"]
    @Published var selPhoto: String = ""

    @Published var pName: String = ""
    @Published var pAge: String = ""
    @Published var pDescr: String = ""
    @Published var pPhoto: String = ""

    @Published var participants: [PartModel] = []
    @Published var selectedParticipant: PartModel?
    
    func addParticipant() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel

        loan.pName = pName
        loan.pAge = pAge
        loan.pDescr = pDescr
        loan.pPhoto = pPhoto

        CoreDataStack.shared.saveContext()
    }

    func fetchParticipants() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.participants = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.participants = []
        }
    }
}
