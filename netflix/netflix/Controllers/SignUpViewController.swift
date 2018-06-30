//
//  ViewController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//


import UIKit
import Firebase

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker:UIImagePickerController!
    
    
    let alertLabel: UILabel = {
        var label = UILabel()
        label.text = "La contraseña debe contener al menos 8 carácteres"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        return label
    }()
    
    let signUpButton: UIButton = {
        var button = UIButton()
//      button = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//      button.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrarse", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.alpha = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        return button
    }()
    
    var activityView:UIActivityIndicatorView! = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.white
        activity.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        return activity
    }()
    
    let nameSignUpTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nombre(s)"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.black
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.layer.cornerRadius = 5.0
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        textField.keyboardType = .default
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    let lastNameSignUpTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Apellido Paterno"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.black
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.layer.cornerRadius = 5.0
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        textField.keyboardType = .default
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    let motherLastNameSignUpTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Apellido Materno"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.black
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.layer.cornerRadius = 5.0
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        textField.keyboardType = .default
        textField.backgroundColor = UIColor.white
        return textField
    }()
    var emailSignUpTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Correo"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = UIColor.black
        email.font = UIFont.systemFont(ofSize: 18)
        email.borderStyle = .none
        email.layer.cornerRadius = 5.0
        email.keyboardType = UIKeyboardType.emailAddress
        email.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        email.keyboardType = .emailAddress
        email.backgroundColor = UIColor.white
        return email
    }()
    
    let passwordSignUpTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Contraseña"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = UIColor.black
        password.borderStyle = .none
        password.font = UIFont.systemFont(ofSize: 18)
        password.layer.cornerRadius = 5.0
        password.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        password.isSecureTextEntry = true
        password.keyboardType = .default
        password.backgroundColor = UIColor.white
        return password
    }()
    
    let passwordConfirmationSignUpTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Repite tu Contraseña"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = UIColor.black
        password.borderStyle = .none
        password.font = UIFont.systemFont(ofSize: 18)
        password.layer.cornerRadius = 5.0
        password.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        password.isSecureTextEntry = true
        password.keyboardType = .default
        password.backgroundColor = UIColor.white
        return password
    }()
    
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "logImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.backgroundColor = UIColor.black
        return image
    }()
    
    let signUpVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    let signUpImageVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        
        
        return stack
    }()
    
    let generalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    override func viewDidLoad(){
        navigationItem.title = "Registro"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Atras", style: .plain, target: self, action: #selector(handleDismissButton))
        view.backgroundColor = UIColor.black
        
        view.addSubview(profileImage)
        view.addSubview(signUpButton)
        view.addSubview(signUpVerticalStack)
        view.addSubview(signUpImageVerticalStack)
        view.addSubview(generalStack)
        view.addSubview(activityView)

        setUpImage()
        setUpVerticalStack()
        setUpImageStack()
        setUpImage()
        setUpSingUpButton()
        setUpActivityView()
        
    }
    
    
    func setUpActivityView() {
        activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityView.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor).isActive = true
        activityView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityView.widthAnchor.constraint(equalToConstant: 279).isActive = true
    }
    
    func setUpImageStack(){
        signUpImageVerticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpImageVerticalStack.widthAnchor.constraint(equalTo: signUpVerticalStack.widthAnchor, multiplier: 0.5).isActive = true
        //signUpImageVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        signUpImageVerticalStack.addArrangedSubview(profileImage)
    }
    
    func setUpVerticalStack(){
        
        
        
        
        
        
        signUpVerticalStack.addArrangedSubview(nameSignUpTextField)
        signUpVerticalStack.addArrangedSubview(lastNameSignUpTextField)
        signUpVerticalStack.addArrangedSubview(motherLastNameSignUpTextField)
        signUpVerticalStack.addArrangedSubview(emailSignUpTextField)
        signUpVerticalStack.addArrangedSubview(passwordSignUpTextField)
        signUpVerticalStack.addArrangedSubview(passwordConfirmationSignUpTextField)
        signUpVerticalStack.addArrangedSubview(alertLabel)
        signUpVerticalStack.addArrangedSubview(signUpButton)
        
        generalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        generalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        generalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        generalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        heightFixer()
        print("framesize\(view.frame.size.height)")
        print("sigunUpSpacesize\(signUpVerticalStack.spacing)")
        print("generalstacksize\(generalStack.spacing)")
        signUpVerticalStack.widthAnchor.constraint(equalTo: generalStack.widthAnchor).isActive = true
        signUpVerticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        generalStack.addArrangedSubview(signUpImageVerticalStack)
        generalStack.addArrangedSubview(signUpVerticalStack)
        
    }
    
    func heightFixer(){
        switch view.frame.size.height {
        case 568:
            generalStack.spacing = 20
            signUpVerticalStack.spacing = 16
        case 667:
            generalStack.spacing = 30
            signUpVerticalStack.spacing = 27
        case 736:
            generalStack.spacing = 32
            signUpVerticalStack.spacing = 32
        default:
            generalStack.spacing = 37
            signUpVerticalStack.spacing = 37
        }
    }
    
    
    func setUpImage(){
        profileImage.heightAnchor.constraint(equalTo: signUpVerticalStack.widthAnchor, multiplier: 0.5).isActive = true
        profileImage.widthAnchor.constraint(equalTo:signUpVerticalStack.widthAnchor, multiplier: 0.5).isActive = true
        profileImage.layer.cornerRadius = (view.frame.size.width - 20) / 4
        profileImage.clipsToBounds = true
    }
    
    func setUpSingUpButton(){
        //signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //signUpButton.widthAnchor.constraint(equalToConstant: 279).isActive = true
    }
    
    @objc func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func setSignUpButtonEnabled(enabled:Bool) {
        if enabled {
            signUpButton.alpha = 1.0
            signUpButton.isEnabled = true
            
        } else {
            signUpButton.alpha = 0.5
            signUpButton.isEnabled = false
        }
        print(signUpButton.isEnabled)
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let email = emailSignUpTextField.text
        let password = passwordSignUpTextField.text
        let confirmPassword = passwordConfirmationSignUpTextField.text
        let name = nameSignUpTextField.text
        let lastName = lastNameSignUpTextField.text
        let formFilled = email != nil && email != "" && password != nil && password != "" && name != nil && name != "" && lastName != nil && lastName != "" && confirmPassword != nil && confirmPassword != ""
        
        if formFilled == true {
            if password == confirmPassword{
                if (password?.count)! > 7 {
                    alertLabel.text = "Se ve bien!"
                    setSignUpButtonEnabled(enabled: true)
                }else{alertLabel.text = "La contraseña debe contener al menos 8 carácteres"}
            }else {alertLabel.text = "Las contraseñas no coinciden"}
        }else{alertLabel.text = "Te faltó llenar algun campo"}
        
        
        //        if formFilled == true && password == confirmPassword && (password?.count)! > 7 {
        //            alertLabel.text = "Se ve bien!"
        //            setSignUpButtonEnabled(enabled: formFilled)
        //        }else if formFilled == true && password != confirmPassword && (password?.count)! > 7{
        //            alertLabel.text = "Las contraseñas no coinciden"
        //            setSignUpButtonEnabled(enabled: false)
        //
        //        }else if formFilled == true && password == confirmPassword && (password?.count)! < 7{
        //            alertLabel.text = "La contraseña debe contener al menos 8 carácteres"
        //            setSignUpButtonEnabled(enabled: false)
        //        }
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        var selectedImageFromPicker : UIImage?
//        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
//            selectedImageFromPicker = editedImage
//        }else if let originalImage =  info["UIImagePickerControllerOriginalImage"] as? UIImage{
//            selectedImageFromPicker = originalImage
//        }
//        if  let selectedImage = selectedImageFromPicker {
//            profileImage.image = selectedImage
//            profileImage.contentMode = .scaleAspectFill
//        }
//        dismiss(animated: true, completion: nil)
//    }
//
//    @objc func openImagePicker(_ sender:Any) {
//        let controller = UIImagePickerController()
//        controller.delegate = self
//        controller.sourceType = .photoLibrary
//        controller.allowsEditing = true
//        present(controller, animated: true, completion: nil)
//    }
//
    
    
    @objc func handleSignUpButton() {
        
        emailSignUpTextField.isEnabled = false
        passwordSignUpTextField.isEnabled = false
        nameSignUpTextField.isEnabled = false
        lastNameSignUpTextField.isEnabled = false
        motherLastNameSignUpTextField.isEnabled = false
        passwordConfirmationSignUpTextField.isEnabled = false
        profileImage.isUserInteractionEnabled = false
        signUpButton.setTitle("", for: .normal)
        setSignUpButtonEnabled(enabled: false)
        activityView?.startAnimating()
        
        handleRegister()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameSignUpTextField{
            lastNameSignUpTextField.becomeFirstResponder()
        }else if textField == lastNameSignUpTextField{
            motherLastNameSignUpTextField.becomeFirstResponder()
        }else if textField == motherLastNameSignUpTextField{
            emailSignUpTextField.becomeFirstResponder()
        }else if textField == emailSignUpTextField{
            passwordSignUpTextField.becomeFirstResponder()
        }else if textField == passwordSignUpTextField{
            passwordConfirmationSignUpTextField.becomeFirstResponder()
        }else if textField == passwordConfirmationSignUpTextField{
            handleSignUpButton()
        }
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func handleRegister(){
        
        
        guard let email = emailSignUpTextField.text, let password = passwordSignUpTextField.text, let name = nameSignUpTextField.text,let lastName = lastNameSignUpTextField.text,let motherLastName = motherLastNameSignUpTextField.text else {
            print("Form is not Valid")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password,completion: { (user,error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: "Escribe un correo valido", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(cancel)
                self.present(alert,animated: true,completion:  nil)
                self.returnButtonInitialState()
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            //succesfuly autebticated user
        
                
                
                //if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!){
                
                   
            let values = ["name" : name,"lastName":lastName,"motherLastName": motherLastName, "email": email,"saldo": "100"]
                        self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
                    
                    
                    
               
            
            
        })
        
    }
    private func registerUserIntoDatabaseWithUID(uid:String,values: [String: AnyObject]){
        let  ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values,withCompletionBlock: {(err,ref)
            in
            
            if (err != nil){
                print("erral subir a base")
            }
            
            
            
            let objVC = MainControllerViewController()
            self.present(objVC, animated: true, completion: nil)
        })
        
    }
    func returnButtonInitialState() {
        
        emailSignUpTextField.isEnabled = true
        passwordSignUpTextField.isEnabled = true
        nameSignUpTextField.isEnabled = true
        lastNameSignUpTextField.isEnabled = true
        passwordConfirmationSignUpTextField.isEnabled = true
        profileImage.isUserInteractionEnabled = true
        signUpButton.setTitle("Registrarse", for: .normal)
        setSignUpButtonEnabled(enabled: false)
        activityView?.stopAnimating()
        emailSignUpTextField.text = ""
        passwordSignUpTextField.text = ""
        nameSignUpTextField.text = ""
        lastNameSignUpTextField.text = ""
        passwordConfirmationSignUpTextField.text = ""
        alertLabel.text = "La contraseña debe contener al menos 8 carácteres"
    }
}

