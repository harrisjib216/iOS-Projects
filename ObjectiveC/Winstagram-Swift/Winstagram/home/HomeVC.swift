//
//  HomeViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/4/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseDatabase
import FirebaseAuth


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var homeTable: UITableView!
    var posts:Array<Any> = []
    
    
    // view loads - init table
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = []
        self.homeTable.delegate = self
        self.homeTable.dataSource = self
        self.homeTable.reloadData()
        loadData()
    }
    
    
    
    // load data
    func loadData() {
        DataManager.shared.fetchPosts() { (result) -> () in
            self.posts = result
            self.homeTable.reloadData()
        }
    }
    
    
    // set posts
    func setPosts(post: Array<Any>) {
        self.posts.append(post)
    }
    
    
    // get posts
    func getPosts() -> Array<Any> {
        return self.posts
    }
    
    
    // make cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    // render cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeTableViewCell
        cell.render(data: posts[indexPath.row] as! Array<Any>)

        return cell
    }
    
    
    // log out
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        do {
            try Auth.auth().signOut()
            self.handleNav(view: "WelcomeVC")
        } catch let err as NSError {
            alert.title = "Uh oh!"
            alert.message = "\(err.localizedDescription)"
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    // nav to new screen
    func handleNav(view: String) {
        self.posts = []
        let home = self.storyboard?.instantiateViewController(withIdentifier: view)
        self.present(home!, animated: false, completion: nil)
    }
}
