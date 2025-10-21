import Foundation

class DataManager {
    var hospitals: [Hospital] = []
    var departments: [Department] = []
    
    init() {
        // Optionally preload a few sample entries for testing
        hospitals.append(Hospital(id: 1, name: "Massachusetts General Hospital", address: "Boston, MA", hasEmergency: true))
        departments.append(Department(id: 101, hospitalId: 1, name: "Cardiology", totalBeds: 4))
    }
    
    // MARK: - HOSPITAL CRUD OPERATIONS
    
    /// Add a new hospital
    func addHospital(_ hospital: Hospital) -> (Bool, String) {
        if hospitals.contains(where: { $0.id == hospital.id }) {
            return (false, "Hospital ID already exists.")
        }
        hospitals.append(hospital)
        return (true, "Hospital added successfully.")
    }
    
    /// Update hospital name only
    func updateHospital(id: Int, newName: String) -> (Bool, String) {
        guard let index = hospitals.firstIndex(where: { $0.id == id }) else {
            return (false, "Hospital not found.")
        }
        hospitals[index].name = newName
        return (true, "Hospital updated successfully.")
    }
    
    /// Delete hospital if it has no linked departments
    func deleteHospital(id: Int) -> (Bool, String) {
        if departments.contains(where: { $0.hospitalId == id }) {
            return (false, "Cannot delete a hospital that has departments linked to it.")
        }
        guard let index = hospitals.firstIndex(where: { $0.id == id }) else {
            return (false, "Hospital not found.")
        }
        hospitals.remove(at: index)
        return (true, "Hospital deleted successfully.")
    }
    
    /// Get all hospitals
    func getAllHospitals() -> [Hospital] {
        return hospitals
    }
    
    // MARK: - DEPARTMENT CRUD OPERATIONS
    
    /// Add a new department (must link to an existing hospital)
    func addDepartment(_ department: Department) -> (Bool, String) {
        guard hospitals.contains(where: { $0.id == department.hospitalId }) else {
            return (false, "Invalid Hospital ID. Department must belong to an existing hospital.")
        }
        if departments.contains(where: { $0.id == department.id }) {
            return (false, "Department ID already exists.")
        }
        departments.append(department)
        return (true, "Department added successfully.")
    }
    
    /// Update department (only name or totalBeds)
    func updateDepartment(id: Int, newName: String?, newBeds: Int?) -> (Bool, String) {
        guard let index = departments.firstIndex(where: { $0.id == id }) else {
            return (false, "Department not found.")
        }
        if let name = newName {
            departments[index].name = name
        }
        if let beds = newBeds {
            departments[index].totalBeds = beds
        }
        return (true, "Department updated successfully.")
    }
    
    /// Delete department if totalBeds < 5
    func deleteDepartment(id: Int) -> (Bool, String) {
        guard let index = departments.firstIndex(where: { $0.id == id }) else {
            return (false, "Department not found.")
        }
        let dept = departments[index]
        if dept.totalBeds >= 5 {
            return (false, "Cannot delete a department with 5 or more beds.")
        }
        departments.remove(at: index)
        return (true, "Department deleted successfully.")
    }
    
    /// Get all departments
    func getAllDepartments() -> [Department] {
        return departments
    }
}
