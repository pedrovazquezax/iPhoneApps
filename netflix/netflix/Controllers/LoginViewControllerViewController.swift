//
//  ViewController.swift
//  netflix
//Users/pedroantoniovazquezrodriguez/Library/Mobile Documents/com~apple~CloudDocs/Documents/ElKevin/netflix/netflix/Controllers
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    
    var activityView:UIActivityIndicatorView! = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.white
        activity.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        
        return activity
    }()
    
    
    
    var emailLoginTextField: UITextField = {
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
    
    let passwordLoginTextField: UITextField = {
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
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("¿Olvidaste tu constraseña?", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    let imageLogInIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.black
        image.image = #imageLiteral(resourceName: "logImage")
        return image
    }()
    let loginVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.contentMode = .scaleAspectFit
        return stack
    }()
    
    let loginButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("Iniciar sesión", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("¿No tienes una cuenta? Registrate!", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    let generalStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        
        
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    @objc func handleSignUp(){
        let objVC: SignUpViewController? = SignUpViewController()
        let aObjNavi = UINavigationController(rootViewController: objVC!)
        present(aObjNavi, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        view.addSubview(imageLogInIcon)
        view.addSubview(generalStack)
        view.addSubview(activityView)
        view.addSubview(signUpButton)
        
        
        
        setUpImageLoginIcon()
        setUpVerticalStackView()
        setUpLoginButton()
        setUpSignButton()
        setUpActivityView()
        
    }
    
    func setUpSignButton(){
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //Buton login contrains
    func setUpLoginButton(){
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalTo: generalStack.widthAnchor).isActive = true
    }
    
    func setUpActivityView() {
        activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor).isActive = true
        activityView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        activityView.widthAnchor.constraint(equalTo: generalStack.widthAnchor).isActive = true
    }
    
    func setUpVerticalStackView(){
        
        loginVerticalStack.addArrangedSubview(emailLoginTextField)
        loginVerticalStack.addArrangedSubview(passwordLoginTextField)
        loginVerticalStack.addArrangedSubview(forgotPasswordButton)
        
        
        generalStack.addArrangedSubview(imageLogInIcon)
        generalStack.addArrangedSubview(loginVerticalStack)
        generalStack.addArrangedSubview(loginButton)
        
        generalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        generalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        generalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        generalStack.spacing = (view.frame.size.width) / 5
        
        
        loginVerticalStack.widthAnchor.constraint(equalTo: generalStack.widthAnchor).isActive = true
        loginVerticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //loginVerticalStack.heightAnchor.constraint(equalToConstant: 130)
    }
    //Image Icons Constrains
    func setUpImageLoginIcon(){
        imageLogInIcon.heightAnchor.constraint(equalTo: generalStack.widthAnchor, multiplier: 0.5).isActive = true
        imageLogInIcon.widthAnchor.constraint(equalTo: generalStack.widthAnchor, multiplier: 0.5).isActive = true
        imageLogInIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageLogInIcon.layer.cornerRadius = (view.frame.size.width - 20) / 4
        imageLogInIcon.clipsToBounds = true
    }
    
    func setLoginButtonEnabled(enabled:Bool) {
        if enabled {
            loginButton.alpha = 1.0
            loginButton.isEnabled = true
        } else {
            loginButton.alpha = 0.5
            loginButton.isEnabled = false
        }
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let email = emailLoginTextField.text
        let password = passwordLoginTextField.text
        let formFilled = email != nil && email != "" && password != nil && password != ""
        setLoginButtonEnabled(enabled: formFilled)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailLoginTextField{
            //emailLoginTextField.resignFirstResponder()
            passwordLoginTextField.becomeFirstResponder()
        }else if textField == passwordLoginTextField{
            handleSignIn()
        }
        return true
    }
    
    @objc func handleSignIn() {
        
        setLoginButtonEnabled(enabled: false)
        emailLoginTextField.isEnabled = false
        passwordLoginTextField.isEnabled = false
        forgotPasswordButton.isEnabled = false
        signUpButton.isEnabled = false
        loginButton.setTitle("", for: .normal)
        activityView?.startAnimating()
        
        
        handleLogin()
        
        
    }
    
    @objc func handleForgotPassword(){
        let alert = UIAlertController(title: "¿Olvidaste tu contraseña?", message: "Escribe tu correo", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa tu correo"
        }
        let send = UIAlertAction(title: "Enviar", style: .default)
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(send)
        alert.addAction(cancel)
        present(alert,animated: true,completion:  nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        print("Estoy tocando")
    }
    
    @objc func handleDismissButton(_ sender: Any) {
        
        let objVC = MainControllerViewController()
        present(objVC, animated: true, completion: nil)
        
        
    }
    
    func handleLogin() {
        guard let email = emailLoginTextField.text, let password = passwordLoginTextField.text else {
            print("Form is not Valid")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Verifica tu Correo y contraseña", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(cancel)
                self.present(alert,animated: true,completion:  nil)
                self.returnButtonsNormalState()
                
                return
            }
            //self.messagesController?.fetchUserAndSetupNavBarTitle()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func dismissKeyboard(){
        emailLoginTextField.endEditing(false)
        passwordLoginTextField.endEditing(false)
    }
    
    func returnButtonsNormalState(){

        self.activityView?.stopAnimating()

        self.setLoginButtonEnabled(enabled: false)
        self.emailLoginTextField.isEnabled = true
        self.passwordLoginTextField.isEnabled = true
        self.forgotPasswordButton.isEnabled = true
        self.signUpButton.isEnabled = true
        self.loginButton.setTitle("Iniciar sesión", for: .normal)
        self.emailLoginTextField.text = ""
        self.passwordLoginTextField.text = ""
    }
}
