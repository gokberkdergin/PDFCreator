//
//  ViewController.swift
//  PDFCreator
//
//  Created by Gökberk on 21.02.2021.
//

import UIKit
import SimplePDFBuilder
class ViewController: UIViewController {
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var titleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func create(_ sender: Any) {
        pdfcreator()
    }
    @IBAction func titlebutton(_ sender: Any) {
        resignFirstResponder()
    }
    
    func pdfcreator() {
        let pdf = PDFBuilder()

        //pdf.wihMetaAuthor("Maks")
        pdf.withMetaCreator("Maks")
        pdf.withMetaTitle("My PDF")

  

        
        pdf.addText(text: "\(titleText.text!)",
                    alignment: .centre,
                    font: .systemFont(ofSize: 18),
                    colour: .red)
        pdf.addText(text: "",
                    alignment: .centre,
                    font: .systemFont(ofSize: 16),
                    colour: .black)
        pdf.addText(text: "\(textview.text!)",
                    alignment: .left,             // default value
                    font: .systemFont(ofSize: 15), // default value
                    colour: .black)

        

        // Build PDF Data
        let data = pdf.build()

        let pdfController = PDFPreviewVC(pdfData: data)
        navigationController?.pushViewController(pdfController, animated: true)
        
    
}
}
