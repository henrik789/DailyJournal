
import UIKit
import CloudKit

enum JournalKeys: String {
    case journalEntry = "journalEntry", dailyEntry = "dailyEntry", journalRecordId = "journalRecordId"
    
}

class CloudManager {
    
    var notes = [CKRecord]()
    let database = CKContainer.default().privateCloudDatabase

    var headlineText: String = ""
    var dailynoteText: String = ""
    
    func saveToCloud() {
        
        let newNote = CKRecord(recordType: "Note")
        newNote.setValue(dailynoteText, forKey: JournalKeys.dailyEntry.rawValue)
        database.save(newNote) { (record, error) in
            print(error as Any , error.debugDescription)
            guard record != nil else {return}
            print(self.dailynoteText, "saved")
        }
    }
    
    
    func queryCloud() -> [CKRecord]{
        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else {return}
            let sortedRecords = records.sorted(by: { $0.creationDate! > $1.creationDate! })
            
            DispatchQueue.main.async {
                self.notes = sortedRecords
            }
        }
        return self.notes
    }
}
