//
//  AddStudentViewController.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//


import UIKit

class AddStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var viewModel = AddStudentViewModel()
    // MARK: - UI Elements
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "defaultProfileImage")
        return imageView
    }()
    
    private let profileImage: UILabel = {
        let label = UILabel()
        label.text = "Select Profile Image"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter ID"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth: "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        datePicker.backgroundColor = .white
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age: "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let agePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let numbers: [Int] = Array(1...100)
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupImageView()
        setupProfileImageLabel()
        setupTextField(idTextField, placeholder: "Enter ID")
        setupTextField(nameTextField, placeholder: "Enter Name")
        setupDateLabel()
        setupDatePicker()
        setupAgeLabel()
        setupAgePicker()
        setupSaveButton()
    }
    
    private func setupImageView() {
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupProfileImageLabel() {
        view.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        view.addSubview(textField)
        if textField == idTextField {
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 40),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                textField.heightAnchor.constraint(equalToConstant: 40)
            ])
        } else if textField == nameTextField {
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 25),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                textField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
    
    private func setupDateLabel() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupDatePicker() {
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            datePicker.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupAgeLabel() {
        view.addSubview(ageLabel)
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupAgePicker() {
        agePicker.delegate = self
        agePicker.dataSource = self
        view.addSubview(agePicker)
        NSLayoutConstraint.activate([
            agePicker.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            agePicker.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 10),
            agePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            agePicker.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSaveButton() {
        saveButton.addTarget(self, action: #selector(saveStudent), for: .touchUpInside)
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func saveStudent() {
          // Update the view model with text field values
          viewModel.updateID(Int(idTextField.text ?? "") ?? 0)
          viewModel.updateName(nameTextField.text ?? "")
          viewModel.updateDateOfBirth(datePicker.date)
          viewModel.updateAge(ageTextField.text ?? "")
        viewModel.updateProfileImage(imageView.image ?? UIImage(named: "defaultProfileImage")!)
  
          let saveResult = viewModel.saveStudent()
          if saveResult.isValid {
              showAlert(title: "Success", message: saveResult.message ?? "Student saved successfully.")
              clearFields()
          } else {
              showAlert(title: "Error", message: saveResult.message ?? "Failed to save student data.")
          }
      }

      private func clearFields() {
          idTextField.text = ""
          nameTextField.text = ""
          // Clear other fields as needed
          ageTextField.text = ""
          // Reset image to default
          imageView.image = UIImage(named: "student")
      }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numbers[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = "\(numbers[row])"
    }
}
