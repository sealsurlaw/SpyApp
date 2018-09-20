import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
            UIPasteboard.general.string = output.text
        } else {
            output.text = "Error encoding"
        }
    }

    @IBAction func decodeButtonPressed(_ sender: Any) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decrypt(plaintext, secret: secretText) {
            output.text = decoded
            UIPasteboard.general.string = output.text
        } else {
            output.text = "Error decoding"
        }
    }
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
}

