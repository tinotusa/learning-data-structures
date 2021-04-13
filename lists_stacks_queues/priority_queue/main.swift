struct Patient: Comparable {
    var name: String
    var priority: Int

    static func <(lhs: Patient, rhs: Patient) -> Bool {
        lhs.priority < rhs.priority
    }
}

func randomPriority() -> Int {
    Int.random(in: 0...10)
}

let patients = [
    Patient(name: "Kate",       priority: randomPriority()),
    Patient(name: "Max",        priority: randomPriority()),
    Patient(name: "Caroline",   priority: randomPriority()),
    Patient(name: "Jacob",      priority: randomPriority()),
    Patient(name: "Luke",       priority: randomPriority()),
]

var emergencyRoom = PriorityQueue<Patient>(from: patients)
while !emergencyRoom.isEmpty {
    let patient = emergencyRoom.dequeue()
    print("Treating: \(patient.name) (priority: \(patient.priority))")
}