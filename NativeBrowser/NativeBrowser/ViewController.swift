//
//  ViewController.swift
//  NativeBrowser
//
//  Created by Tatsuo Ikeda on 2018/02/09.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var fowardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var browserIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        browserView.delegate = self
        urlField.delegate = self
        browserIndicatorView.hidesWhenStopped = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField != urlField {
            return true
        }
        
        if let urlstr = textField.text {
            loadURL(urlstr: urlstr)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField != urlField { return }
        
        textField.selectedTextRange = textField.textRange(
            from: textField.beginningOfDocument,
            to: textField.endOfDocument
        )
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        browserIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let urlstr = webView.request?.url?.absoluteString {
            urlField.text = urlstr
        }
        browserIndicatorView.stopAnimating()
        backButton.isEnabled = webView.canGoBack
        fowardButton.isEnabled = webView.canGoForward
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadURL(urlstr: "https://dotinstall.com")
        addBorder()
    }
    
    func addBorder() {
        let topBorder = CALayer()
        let f = CGRect(x: 0.0, y: 0.0,width: browserView.frame.size.width, height: 1.0)
        topBorder.frame = f
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        browserView.layer.addSublayer(topBorder)
    }
    
    func alert(_ msg: String) {
        let ctrl = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ctrl.addAction(action)
        present(ctrl, animated: true, completion: nil)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if (error as! URLError).code == URLError.cancelled { return }
        alert("Network Error")
        browserView.stopLoading()
        browserIndicatorView.stopAnimating()
    }

    func getValidURL(urlstr: String) -> URL? {
        let clean = urlstr.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if URL(string: clean) == nil {
            return nil
        }
        return URL(string: appendScheme(clean))
    }

    func appendScheme(_ urlstr: String) -> String {
        if URL(string: urlstr)?.scheme == nil {
            return "http://\(urlstr)"
        }
        return urlstr
    }
    
    func loadURL(urlstr: String) {
        guard let url = getValidURL(urlstr: urlstr) else {
            alert("Invalida URL")
            return
        }
        browserView.loadRequest(URLRequest(url: url))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: Any) {
        browserView.goBack()
    }
    
    @IBAction func goFoward(_ sender: Any) {
        browserView.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        browserView.reload()
    }
}
