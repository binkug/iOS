//
//  SceneDelegate.swift
//  Notification
//
//  Created by 304 on 2020/08/18.
//  Copyright © 2020 blkin. All rights reserved.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //로컬 알림에 대한 권한을 요청하는 코드를 작ㄷ성
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(didAllow,e) -> Void in})
        notificationCenter.delegate = self
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }
    //홈 버튼을 눌러서 앱이 백그라운드로 진입할 때 호출되는 메소드
    func sceneWillResignActive(_ scene: UIScene) {
        UNUserNotificationCenter.current().getNotificationSettings(){
        (settings) -> Void in
            //로컬 알림 ㅅ ㅏ용을 허용한 경우
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                //콘텐츠 생성
                let content = UNMutableNotificationContent()
                content.badge = 1
                content.title = "로컬 알람 메시지"
                content.subtitle = "하위 텍스트"
                content.body = "본문 메세지"
                content.sound = UNNotificationSound.default
                
                //로컬 알림에 전달할 데이터를 생성
                //iOS는 자신이 호출하는 콜백 메소드에 데이터를 전달할 때 userInfo라는 이름의 Dictionary를 이용합니다.
                content.userInfo = ["name" : "관리자"]
                
                //트리거 생성
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
                
                //콘텐트와 트리거를 묶어서 요청을 생성
                let request = UNNotificationRequest(identifier: "wakeup", content: content, trigger: trigger)
                
                //등록
                UNUserNotificationCenter.current().add(request)
                
            }else{
                NSLog("권한 사용을 허락하지 않았습니다.")
                
            }
            
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
    
    //로컬알림을 누르면 호출되는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NSLog("로컬 알림 클릭")
    }


}
//애플에선 이런 밑으로 빼서 작성을 한다.
extension SceneDelegate:UNUserNotificationCenterDelegate{
    
}

