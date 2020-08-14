//
//  ViewController.swift
//  TouchEventApp
//
//  Created by 304 on 2020/08/14.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTap: UILabel!
    @IBOutlet weak var lblState: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //현재 뷰 컨트롤러가 FirstResponder가 되도록 설정
        //키보드를 사용할 수 있는 객체가
        //FirstResponder가 되면 키보드가 화면에
        //출력되고 키보드를 누르면 뷰에 입력됩니다.
        self.becomeFirstResponder()
    }
    
    //터치를 하면 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치 1개 가져오기
        let touch = touches.first
        
        //두드린 횟수 가져오기
        let cnt = touch!.tapCount
        //출력
        lblTap.text = "\(cnt) 번 두드림"
        lblState.text = "터치 시작"
    }
    
    //터치가 종료되었을 때 호출되는 메소드
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lblState.text = "터치 종료"
    }
    
    //터치가 움직일 때 호출되는 메소드
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치 1개 가져오기
        let touch = touches.first
        
        //터치가 이미지 뷰에서 발생한 경우에만
        if touch!.view == imgView{
        //이미지 뷰를 터치가 발생한 지점으로 이동
        imgView.center = touch!.location(in: self.view)
        }
    }

    //뷰의 크기가 변경될 때 호출되는 메소드
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            NSLog("가로")
        }
        else{
            NSLog("세로")
        }
    }
   
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.all]
    }
    
    //FirstResponder가 될 수 있도록 해주는 프로퍼티
    override var canBecomeFirstResponder: Bool{
        get{
            return true
        }
    }
    
    //흔들기 시작하면 호출되는 메소드
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        NSLog("흔들기")
    }
}

