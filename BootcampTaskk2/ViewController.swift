//
//  ViewController.swift
//  BootcampTaskk2
//
//  Created by Mac on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private let CollectionViewCellIdentifier = "CollectionViewCellIdentifier"
    
    private let informations: [Information] = [
        .init(name: "Arabalar", image: "arabalarr", description: "Piston Kupa'sını almayı hedefleyen çaylak bir yarışçı olan Şimşek McQueen, son yarışta liderliği 3 yarışçı ile paylaşmıştır. bu yarışcılar Kral lakaplı Strip Weathers ve Chick Hicks'dir. Son bir yarış için California'ya doğru yola çıkan Şimşek McQueen, yolda onu taşıyan araçtan düşer ve kaybolur. Onu taşıyan aracı ararken yolu Radyatör kasabasına düşer. Porsche marka bir araba olan Sally'ye aşık olur ve art arda 3 tane Piston Kupası almış yarışçı Hudson Hornet (Doc) ile tanışır. Kasaba'da yaşayan Çekici Mater ile dostluk kurar. Burda geçirdiği sürede hayatı değişir.", url: "https://tr.wikipedia.org/wiki/Arabalar_(film)"),
        .init(name: "Sungerbob", image: "sungerbobb", description: "SüngerBob KareŞort, kedi gibi miyavlayan evcil salyangozu Gary ile denizin dibinde bir ananasta yaşayan enerjik ve iyimser bir deniz süngeridir. SüngerBob, Yengeç Restoran adlı bir fast food restoranında kızartma aşçısı olarak çalışan ve çocuksu bir yaşama coşkusuna sahip olan bir karakterdir.", url: "https://tr.wikipedia.org/wiki/S%C3%BCngerBob_Kare%C5%9Eort#:~:text=S%C3%BCngerBob%20Kare%C5%9Eort%2C%20kedi%20gibi%20miyavlayan,co%C5%9Fkusuna%20sahip%20olan%20bir%20karakterdir."),
        .init(name: "Tom ve Jerry", image: "tomvejerry", description: "Konu genellikle bir olayın üzerinde gelişir. Ev kedisi Tom ile evin yiyeceğiyle beslenen ve küçük bir yuvada yaşayan Jerry'nin kavgasıdır. Tom her seferinde Jerry'yi avlamaya çalışır ancak hiçbirinde başarılı olamaz ve Jerry akıl oyunlarıyla her zaman galip gelmeyi başarır. Tom'un ise galip geldiği zamanlar oldukça nadirdir.", url: "https://tr.wikipedia.org/wiki/Tom_ve_Jerry"),
        .init(name: "Simpsonlar", image: "simpsonlar", description: "Simpsonlar (İngilizce: The Simpsons), Matt Groening tarafından Fox için yaratılan animasyon televizyon durum komedisidir. Dizi, Homer, Marge, Bart, Lisa ve Maggie'den oluşan orta sınıf bir Amerikan ailesinin satirik bir parodisidir. Şov, Springfield adlı kurgusal bir şehirde geçmekte ve Amerikan kültürünü, toplumunu, televizyonunu ve farklı insanlık hâllerini hicvetmektedir.", url: "https://tr.wikipedia.org/wiki/Simpsonlar"),
        .init(name: "Family Guy", image: "familyguy", description: "Dizi genel olarak kurgusal şehir Quahog, Rhode Island'da yaşayan Peter ve Lois, çocukları Meg, Chris ve Stewie ve antropomorfik köpekleri Brian'dan oluşan Griffin ailesini konu alır. Dizi Amerikan kültürü, toplum, televizyon ve farklı insanlık hâllerini hicvetmektedir.", url: "https://tr.wikipedia.org/wiki/Family_Guy"),
        .init(name: "Taş Devri", image: "tasdevri", description: "Taş Devri (Özgün adı: The Flintstones), ABD kaynaklı televizyon için yapılmış bir çizgi film dizisi. Yapımcısı Hanna-Barbera Productions'dır. 1950 yıllarında serbest olarak sitkomu The Honeymooners sunuculuğunda yayına başladı, Taş Devri 1960 - 1966 yılları arasında Amerikan prime time'da altı sezon boyunca ABC kanalında gösterildi. Taş Devri'nin yayın hakları Screen Gems (ve daha sonra Worldvision Enterprises'e aitken daha sonra Turner Program Services)'e geçti. Şu an yayın hakları Warner Bros. Television'a aittir.", url: "https://tr.wikipedia.org/wiki/Ta%C5%9F_Devri_(%C3%A7izgi_film)"),
        .init(name: "Ben 10", image: "Ben10", description: "Ben 10, Cartoon Network için Man of Action tarafından yapılmış Ben 10 çizgi dizisinden uyarlaması olan ABD çizgi dizisidir. Amerika Birleşik Devletleri'nde 2017 yılında yayınlanmıştır, Türkiye'deyse 10 Ekim 2016'da ön gösterimi olup 29 Ekim 2016 tarihinde yayınlanmaya başlamıştır.", url: "https://tr.wikipedia.org/wiki/Ben_10_(dizi,_2016)"),
        .init(name: "Caillou", image: "Caillou", description: "Caillou (okunuşu: Kayu), Kanadalı yazar Christine L'Heureux ve Kanadalı çizer Hélène Desputaux'un kitaplarından televizyona uyarlanan Kanada yapımı ünlü bir çizgi dizidir. Dizi, Caillou adlı 4 yaşındaki bir erkek çocuğunun insanlarla ilişkilerini ve günlük yaşamını konu alır. Orijinal dili Fransızca olan dizi, farklı dillere çevrilerek ABD'den Almanya'ya, İngiltere'den Türkiye'ye kadar pek çok ülkede yayınlanmıştır.", url: "https://tr.wikipedia.org/wiki/Caillou"),

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
     
    private func registerCells() {
        collectionView.register(.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedInformation = informations[indexPath.row]
        let navigationVC = UINavigationController()
        let detailVC = SecondViewController()
        
        detailVC.information = selectedInformation
        
        navigationVC.viewControllers = [detailVC]
        navigationVC.navigationBar.isHidden = false
        navigationVC.modalPresentationStyle = .fullScreen
        navigationVC.navigationBar.topItem?.title = selectedInformation.name

        present(navigationVC, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return informations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier, for: indexPath) as! CollectionViewCell
        cell.configureUI(with: informations[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
}

private extension CollectionViewCell {
    
    func configureUI(with information: Information) {
        imageView.image = UIImage(named: information.image)
        informationNameLabel.text = information.name
    }
}
