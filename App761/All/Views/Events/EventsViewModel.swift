//
//  EventsViewModel.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isData: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isParticipants: Bool = false
    @Published var isAddPart: Bool = false
    @Published var isAddEvent: Bool = false
    @Published var isSettings: Bool = false

    @AppStorage("records") var records: Int = 0
    
    @AppStorage("partNames") var partNames: [String] = []
    @Published var selParName: String = ""

    @Published var photos: [String] = ["g1", "g2", "g3", "m1"]
    @Published var selPhoto: String = ""
    
    @Published var cases: [String] = ["Information", "Participants", "Statistics"]
    @Published var selCase: String = "Information"
    
    @Published var eventPhoto: [String] = ["hors", "empty"]
    @Published var selEventPhoto: String = ""
    
    @Published var evName: String = ""
    @Published var evLoc: String = ""
    @Published var evDate: String = ""
    @Published var evTime: String = ""
    @Published var evVis: String = ""
    @Published var evType: String = ""
    @Published var evPart: String = ""
    @Published var evBudget: String = ""
    @Published var evPlaces: String = ""
    @Published var evSponsors: String = ""
    @Published var evTickets: String = ""
    @Published var evPhoto: String = ""

    @Published var events: [EventModel] = []
    @Published var selectedEvent: EventModel?
    
    func addEvent() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EventModel", into: context) as! EventModel

        loan.evName = evName
        loan.evLoc = evLoc
        loan.evDate = evDate
        loan.evTime = evTime
        loan.evVis = evVis
        loan.evType = evType
        loan.evPart = evPart
        loan.evBudget = evBudget
        loan.evPlaces = evPlaces
        loan.evSponsors = evSponsors
        loan.evTickets = evTickets
        loan.evPhoto = evPhoto

        CoreDataStack.shared.saveContext()
    }

    func fetchEvents() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventModel>(entityName: "EventModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.events = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.events = []
        }
    }

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
