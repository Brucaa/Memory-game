//
//  ViewController.swift
//  zadatak31ver.3
//
//  Created by Milos Jovanovic on 06/01/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kreiranaPolja()
    }


    var slike: [UIImage?] = [UIImage(named: "1.png"), UIImage(named: "2.png"), UIImage(named: "3.png"), UIImage(named: "4.png"), UIImage(named: "5.png"), UIImage(named: "6.png"), UIImage(named: "7.png"), UIImage(named: "8.png"), UIImage(named: "9.png"), UIImage(named: "10.png"), UIImage(named: "11.png"), UIImage(named: "12.png"), UIImage(named: "13.png"), UIImage(named: "14.png"), UIImage(named: "15.png"), UIImage(named: "16.png"), UIImage(named: "17.png"), UIImage(named: "18.png"),UIImage(named: "1.png"), UIImage(named: "2.png"), UIImage(named: "3.png"), UIImage(named: "4.png"), UIImage(named: "5.png"), UIImage(named: "6.png"), UIImage(named: "7.png"), UIImage(named: "8.png"), UIImage(named: "9.png"), UIImage(named: "10.png"), UIImage(named: "11.png"), UIImage(named: "12.png"), UIImage(named: "13.png"), UIImage(named: "14.png"), UIImage(named: "15.png"), UIImage(named: "16.png"), UIImage(named: "17.png"), UIImage(named: "18.png")]
    
    
    var sveSlike = [UIImageView]()
    var nasumicanBroj = 0
    
    func kreiranaPolja() {
        for m in 0...5 {
            for n in 0...5 {
                let polje = UIButton(frame: CGRect(x: 10 + m * 60, y: 250 + n * 60, width: 60, height: 60))
                let slika = UIImageView(frame: CGRect(x: 10 + m * 60, y: 250 + n * 60, width: 60, height: 60))
                
                view.addSubview(polje)
                view.addSubview(slika)
                sveSlike.append(slika)
                
                polje.tag = 36 - slike.count
                slika.tag = 36 - slike.count
                
                polje.backgroundColor = .green
                polje.layer.borderWidth = 2
                polje.layer.borderColor = UIColor.black.cgColor
                
                nasumicanBroj = Int.random(in: 0...slike.count - 1)
                slika.image = slike[nasumicanBroj]
                slike.remove(at: nasumicanBroj)
                slika.isHidden = true
                
                polje.addTarget(self, action: #selector(otvaranjePolja), for: .touchUpInside)
            }
        }
    }
    
    @IBOutlet weak var brojacPoteza: UILabel!
    
    var poljeJedan = UIButton()
    var poljeDva = UIButton()
    var brojac = 0
    var brojPoteza = 0
    
    @objc func otvaranjePolja(p: UIButton) {
        brojPoteza += 1
        brojacPoteza.text = "\(brojPoteza)"
        
        if brojac == 0, sveSlike[p.tag].isHidden == true {
            poljeJedan = p
            sveSlike[poljeJedan.tag].isHidden = false
            brojac = (brojac + 1) % 3
            
        } else if brojac == 1 {
            if sveSlike[p.tag].isHidden == true {
                poljeDva = p
                sveSlike[poljeDva.tag].isHidden = false
                
                if sveSlike[poljeDva.tag].image == sveSlike[poljeJedan.tag].image {
                    brojac = (brojac - 1) % 3
                    poljeJedan.isEnabled = false
                    poljeDva.isEnabled = false
                } else {
                    brojac = (brojac + 1) % 3
                }
            } else if p.tag == poljeJedan.tag {
                sveSlike[poljeJedan.tag].isHidden = true
                brojac = (brojac - 1) % 3
            }
        } else if brojac == 2 {
            brojac = (brojac - 1) % 3
            if p.tag == poljeJedan.tag {
                sveSlike[poljeDva.tag].isHidden = true
            } else if p.tag == poljeDva.tag {
                sveSlike[poljeJedan.tag].isHidden = true
                
                poljeJedan = poljeDva
            } else {
                sveSlike[poljeJedan.tag].isHidden = true
                sveSlike[poljeDva.tag].isHidden = true
                sveSlike[p.tag].isHidden = false
                
                poljeJedan = p
                }
            }
        }

    
    @IBAction func resetovanje(_ sender: Any) {
        for s in view.subviews {
            if s.isMember(of: UIButton.self) {
                (s as! UIButton).isEnabled = true
            }
        }
        for i in view.subviews {
            if i.isMember(of: UIImageView.self) {
                (i as! UIImageView).isHidden = true
                slike.append((i as! UIImageView).image)
            }
        }
        
        for i in view.subviews {
            if i.isMember(of: UIImageView.self) {
                nasumicanBroj = Int.random(in: 0...slike.count - 1)
                (i as! UIImageView).image = slike[nasumicanBroj]
                slike.remove(at: nasumicanBroj)
            }
        }
        
        brojac = 0
        brojPoteza = 0
        brojacPoteza.text = "\(brojPoteza)"
    }
    
    }






