//
//  PlanCreateViewController.swift
//  DateShare
//
//  Created by 木下真菜 on 2021/12/29.
//

import UIKit

class PlanCreateViewController: UIViewController {
    
    var posX: CGFloat!
    
    let dateTextField = UITextField()
    let startTimeTextField = UITextField()
    let finishTimeTextField = UITextField()
    var planImage = UIImageView()
    var addImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWide = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height

        //scrollView
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: screenWide, height: screenHeight)
        self.view.addSubview(scrollView)
        
        //TextFieldたち
        let planTitleTextField = UITextField()
        planTitleTextField.frame = CGRect(x: 10, y: 100, width: screenWide - 20, height: 30)
        planTitleTextField.placeholder = "タイトル"
        planTitleTextField.keyboardType = .default
        planTitleTextField.borderStyle = .roundedRect
        scrollView.addSubview(planTitleTextField)
        
        
        let contentsTextView = UITextView()
        contentsTextView.frame = CGRect(x: 10, y: 140, width: screenWide - 20, height: 50)
        contentsTextView.keyboardType = .default
        contentsTextView.layer.borderWidth = 1.0
        contentsTextView.layer.borderColor = UIColor.lightGray.cgColor
        scrollView.addSubview(contentsTextView)
        
        
        //日付のtextField
        dateTextField.frame = CGRect(x: 10, y: 200, width: screenWide - 20, height: 30)
        dateTextField.placeholder = "日付"
        dateTextField.keyboardType = .default
        dateTextField.borderStyle = .roundedRect
        scrollView.addSubview(dateTextField)
        
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 10, y: 200, width: self.view.frame.size.width, height: 300)
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateTextField.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        dateTextField.inputAccessoryView = toolbar
        
        
        let meetingTimeTextField = UITextField()
        meetingTimeTextField.frame = CGRect(x: 10, y: 240, width: screenWide - 20, height: 30)
        meetingTimeTextField.placeholder = "集合時間"
        meetingTimeTextField.keyboardType = .default
        meetingTimeTextField.borderStyle = .roundedRect
        scrollView.addSubview(meetingTimeTextField)
        
        
        let placeTextField = UITextField()
        placeTextField.frame = CGRect(x: 10, y: 280, width: screenWide - 20, height: 30)
        placeTextField.placeholder = "場所"
        placeTextField.keyboardType = .default
        placeTextField.borderStyle = .roundedRect
        scrollView.addSubview(placeTextField)
        
        
        //プラン入力
        startTimeTextField.frame = CGRect(x: 10, y: 350, width: screenWide / 5, height: 30)
        startTimeTextField.placeholder = "開始時間"
        startTimeTextField.keyboardType = .default
        startTimeTextField.borderStyle = .roundedRect
        scrollView.addSubview(startTimeTextField)
        
        let startDatePicker = UIDatePicker()
        startDatePicker.frame = CGRect(x: 10, y: 200, width: self.view.frame.size.width, height: 300)
        startDatePicker.datePickerMode = .time
        startDatePicker.timeZone = NSTimeZone.local
        startDatePicker.locale = Locale.current
        startTimeTextField.inputView = startDatePicker
        
        let startToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let startSpacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let startDoneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(startDone))
        startToolbar.setItems([startSpacelItem, startDoneItem], animated: true)
        startTimeTextField.inputAccessoryView = startToolbar
        
        
        finishTimeTextField.frame = CGRect(x: screenWide / 4, y: 350, width: screenWide / 5, height: 30)
        finishTimeTextField.placeholder = "終了時間"
        finishTimeTextField.keyboardType = .default
        finishTimeTextField.borderStyle = .roundedRect
        scrollView.addSubview(finishTimeTextField)
        
        let finishDatePicker = UIDatePicker()
        finishDatePicker.frame = CGRect(x: 10, y: 200, width: self.view.frame.size.width, height: 300)
        finishDatePicker.datePickerMode = .time
        finishDatePicker.timeZone = NSTimeZone.local
        finishDatePicker.locale = Locale.current
        finishTimeTextField.inputView = finishDatePicker
        
        let finishToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let finishSpacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let finishDoneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(finishDone))
        finishToolbar.setItems([finishSpacelItem, finishDoneItem], animated: true)
        finishTimeTextField.inputAccessoryView = finishToolbar
        
        
        //プランの写真
        planImage = UIImageView(image: UIImage(named: "see"))
        planImage.frame = CGRect(x: 10, y: 400, width: screenWide - 20, height: 300)
        planImage.isUserInteractionEnabled = true
        planImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        scrollView.addSubview(planImage)
        
        let planTextView = UITextView()
        planTextView.frame = CGRect(x: 10, y: 710, width: screenWide - 20, height: 50)
        planTextView.keyboardType = .default
        planTextView.layer.borderWidth = 1.0
        planTextView.layer.borderColor = UIColor.lightGray.cgColor
        scrollView.addSubview(planTextView)
        
        
        //投稿ボタンたち
        let keepPlanButton = UIButton()
        keepPlanButton.frame = CGRect(x: 10, y: 800, width: screenWide / 6, height: 30)
        keepPlanButton.setTitle("保存", for: UIControl.State.normal)
        keepPlanButton.setTitleColor(.white, for: .normal)
        keepPlanButton.backgroundColor = UIColor.init(red: 235/255, green: 126/255, blue: 152/255, alpha: 1)
        scrollView.addSubview(keepPlanButton)
        
        let sharePlanButton = UIButton()
        sharePlanButton.frame = CGRect(x: screenWide / 2, y: 800, width: screenWide / 6, height: 30)
        sharePlanButton.setTitle("共有", for: UIControl.State.normal)
        sharePlanButton.setTitleColor(.white, for: .normal)
        sharePlanButton.backgroundColor = UIColor.init(red: 235/255, green: 126/255, blue: 152/255, alpha: 1)
        scrollView.addSubview(sharePlanButton)
        
        let postPlanButton = UIButton()
        postPlanButton.frame = CGRect(x: screenWide / 4, y: 800, width: screenWide / 6, height: 30)
        postPlanButton.setTitle("投稿", for: UIControl.State.normal)
        postPlanButton.setTitleColor(.white, for: .normal)
        postPlanButton.backgroundColor = UIColor.init(red: 235/255, green: 126/255, blue: 152/255, alpha: 1)
        scrollView.addSubview(postPlanButton)
    }
    
    @objc func done(){
        dateTextField.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        dateTextField.text = "\(formatter.string(from: Date()))"
    }
    
    @objc func startDone(){
        let formatter = DateFormatter()
        
        formatter.dateFormat = "H時m分"
        startTimeTextField.text = "\(formatter.string(from: Date()))"
    }
    
    @objc func finishDone(){
        let formatter = DateFormatter()
        
        formatter.dateFormat = "H時m分"
        startTimeTextField.text = "\(formatter.string(from: Date()))"
    }
    
    //写真がタップされた時の処理
    @objc func tapped(){
        print("写真がタップされました")
        addImagePickerView()
    }
    
    //保存ボタンがタップされた時の処理
    @objc func keppButtonTapped(){
        print("保存ボタンがタップされました")
    }
    
    

}

//横方向へのスクロールを禁止する
extension PlanCreateViewController: UIScrollViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        posX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = posX
    }
}

//フォトライブラリから写真を選択する処理
extension PlanCreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func addImagePickerView(){
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        self.present(pickerController, animated: true, completion: nil)
    }
    
    //フォトライブラリの写真を選択した際の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? else {return}
        
        addImage = selectedImage
        planImage.image = addImage
        
        self.dismiss(animated: true, completion: nil)
    }
}
