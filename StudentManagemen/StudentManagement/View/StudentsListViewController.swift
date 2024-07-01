//
//  StudentsListViewController.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//
//Implement a UITabbar controller
//the first tab has a navigation controller with a list of students(photo, names),
//click on any row should navigate to the second screen and display student details(id, name, age, photo, date)
//the second tab has add student details(age - uipickerview, date - uidatepicker)
//after adding student, student will display 1st tab.
//Photo - pick from library and update

import UIKit

class StudentsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.black
        
        // Check if no data is available initially
        if StudentDataModel.shared.students.isEmpty {
            showNoDataAlert()
        }
    }
    
    func showNoDataAlert() {
        let alert = UIAlertController(title: "No Data Available", message: "No students have been added yet.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentDataModel.shared.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        let student = StudentDataModel.shared.students[indexPath.row]
        cell.profileImage.image = student.photo
        cell.studentName.text = student.name
        cell.studentName.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        detailsViewController.student = StudentDataModel.shared.students[indexPath.row]
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()  // Reload data every time the view appears
        
        // Check if no data is available when view appears
        if StudentDataModel.shared.students.isEmpty {
            showNoDataAlert()
        }
    }
}

