//
//  WordViewController.swift
//  NewlyCoinedword
//
//  Created by 정경우 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var wordFirstButton: UIButton!
    let wordDictionary = ["신조어1":"신조어1입니다","신조어2":"신조어2입니다","신조어3":"신조어3입니다"]
    let wordList = ["신조어1","신조어2","신조어3"]
    var wordTextFieldCount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // wordFirstButton.titleLabel?.font = .systemFont(ofSize: 10)
        // wordFirstButton.titleLabel?.textColor = .brown
        //  wordFirstButton.isHidden = false
        
        // wordTextField.text = getRandom()
        
        
    }
    @discardableResult
    func getRandom() -> String{
        
        let random = ["1","2","3","4","5","6"]
        let result = random.randomElement()!
        return result
    }
    
    
    @IBAction func keyEdit(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
    }
    
    //버튼 클릭시 텍스트필드의 텍스트에 버튼 타이틀이 들어가는 기능, 버튼 3개다 넣어주기
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        //print(sender.currentTitle) -> 15이상에서 안나올수도?
        // print(sender.titleLable?.text)
        wordTextField.text = wordList[sender.tag - 1]
        textFieldKeyboardTapped(wordTextField)
    }
    
    
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        
        if let wordTextFieldValue = wordTextField.text {
            wordTextFieldCount = wordTextFieldValue.count
        }
        
        if wordTextFieldCount >= 2 {
            
            switch wordTextField.text?.uppercased() {
                // 함수 안이니 sender(파리미터) 사용가능, 영어 대소문자 대응
            case "신조어3":
                // 쉼표로 조건을 이을 수 있다 "신조어3","신조어2"
                resultLabel.text = wordDictionary["신조어3"]
            case "신조어2":
                // 컬렉션을 써보기
                resultLabel.text = wordDictionary["신조어2"]
            case "신조어":
                resultLabel.text = wordDictionary["신조어1"]
            default:
                resultLabel.text = "찾는 결과가 없습니다."
                
            }
        }else {
            let alert = UIAlertController(title: "알림", message: "한글자이거나 빈칸입니다", preferredStyle: .alert)
            
            let button1 = UIAlertAction(title: "확인", style: .default)
            alert.addAction(button1)
            present(alert, animated: true)
            
        }
    }
    
}

