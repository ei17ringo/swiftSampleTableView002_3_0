//
//  ViewController.swift
//  sampleTableView002
//
//  Created by Eriko Ichinohe on 2016/02/05.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var selectedIndex = -1
    //データを配列で用意する
    var tea_list = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tea_list.count
    }
    
    // 表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.brown
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel!.text = "\(tea_list[(indexPath as NSIndexPath).row])"
        return cell
        
    }
    
    // 選択された時に行う処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((indexPath as NSIndexPath).row)行目を選択")
        selectedIndex = (indexPath as NSIndexPath).row
    performSegue(withIdentifier: "showSecondView",sender: nil)
    }

    // Segueで画面遷移する時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! secondViewController
        
        secondVC.scSelectedIndex = selectedIndex
        
//            if (segue.identifier == "showSecondView") {
//                let secondVC: secondViewController = (segue.destinationViewController as? secondViewController)!
//                
//                // SecondViewControllerのtextに選択した文字列を設定する
//                // secondVC.text = selectedText
//            }
    }
}

