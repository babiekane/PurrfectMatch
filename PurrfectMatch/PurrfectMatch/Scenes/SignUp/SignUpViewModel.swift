//
//  AuthViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 3/10/2566 BE.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices
import CryptoKit
import GoogleSignInSwift
import GoogleSignIn

class SignUpViewModel: NSObject, ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var showPassword = false
  @Published var showAlert = false
  
  @Published var isLoading = false
  
  init(onSignupSuccess: @escaping () -> Void, onPressLogin: @escaping () -> Void) {
    self.onSignupSuccess = onSignupSuccess
    self.onPressLogin = onPressLogin
  }
  
  let onSignupSuccess: () -> Void
  let onPressLogin: () -> Void
  
  var onLoginSelected: (() -> Void)?
  
  func selectLogin() {
    onLoginSelected?()
  }
  
  private var nonce = ""
  private let auth = Auth.auth()
  
  func signUp(email: String, password: String) {
    isLoading = true
    
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      DispatchQueue.main.async {
        self?.isLoading = false
        
        guard result != nil, error == nil else {
          return
        }
        
        self?.onSignupSuccess()
      }
    }
  }
  
  func logInWithApple() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    let nonce = randomNonceString()
    self.nonce = nonce
    request.requestedScopes = [.email, .fullName]
    request.nonce = sha256(nonce)
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = UIApplication.shared.windows.first?.rootViewController
    authorizationController.performRequests()
  }
  
    func logInWithGoogle() {
      guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
        return
      }
  
      GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
        guard let result = signInResult else {
          // Inspect error
          if let error = error {
            print(error.localizedDescription)
            return
          }
          return
        }
  
        let user = result.user
        guard let idToken = user.idToken?.tokenString else {
          return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: user.accessToken.tokenString)
        self.auth.signIn(with: credential) { authResult, error in
          if let error = error {
            print(error.localizedDescription)
            return
          }
  
          DispatchQueue.main.async {
            self.onSignupSuccess()
          }
        }
      }
    }
  }

  extension SignUpViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      print(error.localizedDescription)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
        print("error with firebase")
        return
      }
      
      // Getting Token
      guard let token = credential.identityToken else {
        print("error with firebase")
        return
      }
      
      // Token string
      guard let tokenString = String(data: token, encoding: .utf8) else {
        print("error with Token")
        return
      }
      
      let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
      
      Auth.auth().signIn(with: firebaseCredential) { result, error in
        if let error = error {
          print(error.localizedDescription)
          return
        }
        
        //success
        DispatchQueue.main.async {
          self.onSignupSuccess()
        }
      }
    }
  }
  
  // Login with Apple
  
  func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
      String(format: "%02x", $0)
    }.joined()
    
    return hashString
  }
  
  func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    var randomBytes = [UInt8](repeating: 0, count: length)
    let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
    if errorCode != errSecSuccess {
      fatalError(
        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
      )
    }
    
    let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    
    let nonce = randomBytes.map { byte in
      // Pick a random character from the set, wrapping around if needed.
      charset[Int(byte) % charset.count]
    }
    
    return String(nonce)
  }
  
  extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
      return view.window!
    }
  }
