//
//  ViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/11/30.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    var scrollViewHeader: UIScrollView?
//    var scrollViewBody: UIScrollView?
    
    let numberOfButtons = 5
    let namesOfButton = ["关注", "推荐", "热榜", "上海", "科技"]
    
//    let sectionsNumber = 5    // 区块的数目
//    let sectionHeight = 180   // 区块的高度
    
    let data = GetData().sections  // 获取数据
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "今日头条"
        
        print(data.count)
        
        initScrollView()
        
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .gray
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollViewHeader!.snp.bottom)
            make.left.equalTo(scrollViewHeader!.snp.left)
            make.size.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        // 遵守协议
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // 初始化导航栏
    func initScrollView(){
        scrollViewHeader = UIScrollView()
        scrollViewHeader?.layer.borderWidth = 1
        scrollViewHeader?.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(scrollViewHeader!)

        scrollViewHeader!.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(18)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
                
        var alignLeft = scrollViewHeader!.snp.left   // 上一个Button的左边, ConstraintItem类型
        for index in 0..<self.numberOfButtons {
            let button = UIButton()
            scrollViewHeader!.addSubview(button)
                
            button.snp.makeConstraints { (make) in
                make.height.equalToSuperview()
                make.width.equalToSuperview().dividedBy(self.numberOfButtons)
                make.left.equalTo(alignLeft)
            }
            alignLeft = button.snp.right

            button.setTitle(namesOfButton[index], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.blue, for: .selected)
            
            button.addTarget(self, action: #selector(pageJump), for: .touchDown)
        }
    }
    
    

}
//
//
extension ViewController{

    @objc func pageJump() {
        print("main to dest")
//        //创建一个页面
//        let destination = DestinationViewController()
//        //取目标页面的一个变量进行赋值，以属性的方式进行传值。
//        destination.message = "传递的信息"

        let first = FirstViewController()

        //跳转
        self.navigationController?.pushViewController(first, animated: true)
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("222")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .red
        cell.data = self.data[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你打印了第 \(indexPath) 行")
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
    }
}

