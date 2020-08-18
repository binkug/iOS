//
//  ViewController.swift
//  PickerView
//
//  Created by 304 on 2020/08/18.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //이미지 파일이름을 저장할 배열
    var imageFileName = [String]()
    //이미지를 저장할 배열
    var imageArray = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 파일 배열과 이미지 배열에 데이터를 추가
        for i in 0...4{
            imageFileName.append("red\(i).jpg")
            let image = UIImage(named: "red\(i).jpg")
            imageArray.append(image)
        }
        
        //테스트 코드
        //NSLog(imageFileName.description)
        //NSLog(imageArray.description)
        
        //레이블과 이미지 뷰 초기화
        lblImageName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        //pickerView의 프로토콜 메소드 구현 위치를 설정
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //처음 이미지를 설정해줄 수 있음
        //pickerView.selectRow(3, inComponent: 0, animated: true)
        
        
    }


}

//PickerView 관련 메소드를 구현할 extension
extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    //열의 개수를 설정하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //행의 개수를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 배열의 데이터 개수 리턴
       // return imageFileName.count
        return 10000
    }
    /*
    //피커 뷰에 문자열을 출력해주는 메소드
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
     */
    
    //피커 뷰에 출력하는 메소드
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row % 5])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 130)
        return imageView
    }
    
    //피커뷰에 높이를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 130
    }
    
    //선택을 했을 때 호출되는 메소드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageName.text = imageFileName[row % 5]
        imageView.image = imageArray[row % 5]
    }
    //extension에 문자열 출력하는 메소드를 주석처리 하고 뷰를 리턴하는 메소드를 구현해서
    //PikerView에 이미지 출력
}
