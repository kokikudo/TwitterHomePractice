//
//  ViewController.swift
//  TwitterHomePractice
//
//  Created by kudo koki on 2021/03/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let item = ["cell1", "cell2", "cell3", "cell4", "cell5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UITableViewのインスタンス生成
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        // デリゲートを設定しプロトコルの設定を自分自身に委譲
        tableView.delegate = self
        tableView.dataSource = self
        // viewに反映
        view.addSubview(tableView)
    }
    
    // セルの表示個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    // セルを構成する際の情報
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルのIdentifierを指定しセルオブジェクトを作成
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        // セルに配置されている情報を設定
        cell.textLabel?.text = item[indexPath.row]
        return cell
    }
    
    
}

