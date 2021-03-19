//
//  ViewController.swift
//  TwitterHomePractice
//
//  Created by kudo koki on 2021/03/17.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var item = [
        ["name": "田中",
         "content": "会食やら飲み会やらGotoトラベルやらでウェーイってやってる人だけがコロナに罹るならまだ自業自得と言えるけどそうではないからなー。",
         "date": Date().timeIntervalSince1970 - 313123123],
        ["name": "清水",
         "content": "Gotoトラベルの段階的再開に向けた動きあり。「4月中の再開を目指す。」「5月中には全国拡大したい。」とのことです。",
         "date": Date().timeIntervalSince1970 - 2323232],
        ["name": "吉田",
         "content": "コロナ対策に打つ手がないといっていた政権が「Gotoトラベル」再開を目指す？",
         "date": Date().timeIntervalSince1970 - 3333],
        ["name": "京都新聞",
         "content": "Gotoトラベル、4月部分再開目指す。政府、大型連休には全国拡大案も(京都新聞)",
         "date": Date().timeIntervalSince1970 - 10]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // セルを降順にソート
        item = item.reversed()
        // UITableViewのインスタンス生成
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        // .xibのセルを反映させる
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        // 時間を設定
        let nowTime = Date().timeIntervalSince1970
        let past = item[indexPath.row]["date"] as! TimeInterval
        
        // セル内の各オブジェクトに値を設定
        cell.time.text = timeCheck(now: nowTime, past: past)
        cell.content.text = (item[indexPath.row]["content"] as! String)
        cell.name.text = (item[indexPath.row]["name"] as! String)
        return cell
    }
    
    // 時間の表示形式を決定する関数
    func timeCheck(now: TimeInterval, past: TimeInterval) -> String {
        // 今の時間とツイートした時間の差
        let timeDiff = Int(now - past)
        
        // 時間差は秒単位の値なので、各単位に変換可能か確認
        let year = timeDiff / 31104000
        let month = timeDiff / 2592000
        let day = timeDiff / 86400
        let hour = timeDiff / 3600
        let minute = timeDiff / 60
        let second = timeDiff
        
        if year != 0 {
            return "\(year)年前"
        } else if month != 0 {
            return "\(month)ヶ月前"
        } else if day != 0 {
            return "\(day)日前"
        } else if hour != 0 {
            return "\(hour)時間前"
        } else if minute != 0 {
            return "\(minute)分前"
        } else {
            return "\(second)秒前"
        }
    }
}

