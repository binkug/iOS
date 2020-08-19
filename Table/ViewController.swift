//
//  ViewController.swift
//  Table
//
//  Created by 304 on 2020/08/19.
//  Copyright © 2020 blkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //테이블 뷰에 출력할 데이터
    var data = Array<String>()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append("기본 테이블")
        //테이블 뷰의 delegate 외 dataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //셀의 아이디
            let cellIdenfier = "Cell"
            //셀을 생성 - 재사용 가능한 셀로 생성
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfier)
            //재사용 가능한 셀이 없으면 생성
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellIdenfier)
            }
            
            //셀에 데이터를 출력
            cell!.textLabel!.text = data[indexPath.row]
            //셀을 리턴
            return cell!
    }
}

