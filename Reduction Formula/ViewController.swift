//
//  ViewController.swift
//  Reduction Formula
//
//  Created by Thomas Sheridan on 05/07/2015.
//  Copyright (c) 2015 Thomas Sheridan. All rights reserved.
//



import UIKit
import iAd

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate, ADBannerViewDelegate{
    
    var bannerView:ADBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        self.bannerView?.delegate = self
        self.bannerView?.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        selctionButtonView.enabled = false
        MainGroupSelector.dataSource = self
        MainGroupSelector.delegate = self
        imputA.delegate = self
        ImputB.delegate = self
        imputC.delegate = self
        imputD.delegate = self
        imputE.delegate = self
        imputF.delegate = self
        imputG.delegate = self
        imputH.delegate = self
        imputI.delegate = self
        imputJ.delegate = self
        imputK.delegate = self
        imputL.delegate = self
        M.delegate = self
        imputA.keyboardType = .NumberPad
        ImputB.keyboardType = .NumberPad
        imputC.keyboardType = .NumberPad
        imputD.keyboardType = .NumberPad
        imputE.keyboardType = .NumberPad
        imputF.keyboardType = .NumberPad
        imputG.keyboardType = .NumberPad
        imputH.keyboardType = .NumberPad
        imputI.keyboardType = .NumberPad
        imputJ.keyboardType = .NumberPad
        imputK.keyboardType = .NumberPad
        imputL.keyboardType = .NumberPad
        M.keyboardType = .NumberPad
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.bannerView?.hidden = false
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    return willLeave
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView?.hidden = true
    }
    
    
    
    @IBOutlet var MainScrollView: UIScrollView!
    @IBOutlet weak var MainGroupSelector: UIPickerView!
    @IBOutlet weak var selctionButtonView: UIButton!
    @IBOutlet weak var mockLabel: UILabel!
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var imputA: UITextField!
    @IBOutlet weak var ImputB: UITextField!
    @IBOutlet weak var imputC: UITextField!
    @IBOutlet weak var imputD: UITextField!
    @IBOutlet weak var imputE: UITextField!
    @IBOutlet weak var imputF: UITextField!
    @IBOutlet weak var imputG: UITextField!
    @IBOutlet weak var imputH: UITextField!
    @IBOutlet weak var imputI: UITextField!
    @IBOutlet weak var imputJ: UITextField!
    @IBOutlet weak var imputK: UITextField!
    @IBOutlet weak var imputL: UITextField!
    @IBOutlet weak var M: UITextField!
    
    let sigma = "σ"
    let tau = (1.0/2.0) * (pow(5.0,0.5)+1.0)
    let pickerData = [["C","D","T","O"],["", "₂", "₃", "₄", "₅", "₆"], ["", "v", "h", "d", "s", "i"]]
    
    
    
    @IBAction func explainButton(sender: UIButton) {
        
        let alert = UIAlertView()
        alert.title = "How This Works"
        alert.message = "First select a Point group with the 'wheels' above, e.g. C2v or C2 or Oh."
            
            + "\n\r"
            
            + "\n (the top value on the second and third wheel is blank allowing the selection of point groups such as D3 or Td which don't have a 'middle' or 'end' character in their notation)"
            
            + "\n\r"
            
            + "\n Then simply type the relevant value of the reducible representation into the box that prompts for that value. Finally click 'Reduce representation' and the answer will appear where the Γ [capital gamma] was."
        
        alert.addButtonWithTitle("Got it")
        alert.show()
    }
    
    
    //MARK -Instance Methods
    func updateLabel(){
        let MainGroup = pickerData[0][MainGroupSelector.selectedRowInComponent(0)]
        let nValue = pickerData[1][MainGroupSelector.selectedRowInComponent(1)]
        let oppSymbol = pickerData[2][MainGroupSelector.selectedRowInComponent(2)]
        var compoundValue = MainGroup + nValue + oppSymbol
        selctionButtonView.setTitle("Reduce representation", forState: UIControlState.Normal)
        
        if compoundValue == "C₂v"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "C2"
            imputC.text = "σv(xz)"
            imputD.text = "σv(yz)"
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₂v)"
        
        }
        
        else if compoundValue == "C₃v"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C3"
            imputC.text = "3σv"
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₃v)"
            
        }
        
        else if compoundValue == "C₄v"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C4"
            imputC.text = "C2"
            imputD.text = "2σv"
            imputE.text = "2σd"
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₄v)"
            
        }
        
        else if compoundValue == "C₅v"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C5"
            imputC.text = "2C2/5"
            imputD.text = "5σv"
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₅v)"
            
        }
        
        else if compoundValue == "C₆v"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C6"
            imputC.text = "2C3"
            imputD.text = "C2"
            imputE.text = "3σv"
            imputF.text = "3σd"
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₆v)"
            
        }
        
        else if compoundValue == "C₂h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "C2"
            imputC.text = "i"
            imputD.text = "σh"
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₂h)"
            
        }
        
        else if compoundValue == "D₂h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "C2(z)"
            imputC.text = "C2(y)"
            imputD.text = "C2(x)"
            imputE.text = "i"
            imputF.text = "σ(xy)"
            imputG.text = "σ(xz)"
            imputH.text = "σ(yz)"
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₂h)"
            
        }
        
        else if compoundValue == "D₃h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C3"
            imputC.text = "3C2"
            imputD.text = "σh"
            imputE.text = "2S3"
            imputF.text = "3σv"
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₃h)"
            
        }
        
        else if compoundValue == "D₄h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C4"
            imputC.text = "C2"
            imputD.text = "2C2'"
            imputE.text = "2C2''"
            imputF.text = "i"
            imputG.text = "2S4"
            imputH.text = "σh"
            imputI.text = "2σv"
            imputJ.text = "2σd"
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₄h)"
            
        }
        
        else if compoundValue == "D₅h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C5"
            imputC.text = "2C2/5"
            imputD.text = "5C2'"
            imputE.text = sigma + "h"
            imputF.text = "2S5"
            imputG.text = "2S3/5"
            imputH.text = "5" + sigma + "v"
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₅h)"
            
        }
        
        else if compoundValue == "D₆h"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C6"
            imputC.text = "2C3"
            imputD.text = "C2"
            imputE.text = "3C2'"
            imputF.text = "3C2''"
            imputG.text = "i"
            imputH.text = "2S3"
            imputI.text = "2S6"
            imputJ.text = sigma + "h"
            imputK.text = "3" + sigma + "d"
            imputL.text = "3" + sigma + "v"
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₆h)"
            
        }
        
        else if compoundValue == "D₂d"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2S4"
            imputC.text = "C2"
            imputD.text = "2C2'"
            imputE.text = "2σd"
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₂d)"
            
        }
        
        else if compoundValue == "D₃d"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C3"
            imputC.text = "3C2'"
            imputD.text = "i"
            imputE.text = "2S6"
            imputF.text = "3"+sigma+"d"
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₃d)"
            
        }
        
        else if compoundValue == "D₄d"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2S8"
            imputC.text = "2C4'"
            imputD.text = "2S3/8"
            imputE.text = "C2"
            imputF.text = "4C2'"
            imputG.text = "4" + sigma + "d"
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₄d)"
            
        }
        
        else if compoundValue == "D₅d"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C5"
            imputC.text = "2C2/5"
            imputD.text = "5C2"
            imputE.text = "i"
            imputF.text = "2S3/10"
            imputG.text = "2S10"
            imputH.text = "5"+sigma+"d"
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₅d)"
            
        }
        
        else if compoundValue == "Td"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "8C3"
            imputC.text = "3C2"
            imputD.text = "6S4"
            imputE.text = "6σh"
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(Td)"
            
        }
        
        else if compoundValue == "Oh"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "8C3"
            imputC.text = "6C2"
            imputD.text = "6C4"
            imputE.text = "3C2(C2/4)"
            imputF.text = "i"
            imputG.text = "6S4"
            imputH.text = "8S6"
            imputI.text = "3"+sigma+"h"
            imputJ.text = "6"+sigma+"d"
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(Oh)"
            
        }
        
        else if compoundValue == "Cs"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = sigma+"h"
            imputC.text = ""
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(Cs)"
            
            
        }
        
        else if compoundValue == "Ci"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "i"
            imputC.text = ""
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(Ci)"
            
        }
        
        else if compoundValue == "C₂"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "C2"
            imputC.text = ""
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(C₂)"
            
        }
        
        else if compoundValue == "D₂"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "C2(z)"
            imputC.text = "C2(y)"
            imputD.text = "C2(x)"
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₂)"
            
        }
        
        else if compoundValue == "D₃"{
            MyLabel.textColor = UIColor.greenColor()
            MyLabel.text = compoundValue + " point group selected"
            imputA.text = "E"
            ImputB.text = "2C3"
            imputC.text = "3C2"
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
            mockLabel.textColor = UIColor.blackColor()
            mockLabel.text = "Γ(D₃)"
            
        }
        
        else{
            MyLabel.textColor = UIColor.redColor()
            MyLabel.text = "ERROR: '" + compoundValue + "' is not a valid point group"
            imputA.text = ""
            ImputB.text = ""
            imputC.text = ""
            imputD.text = ""
            imputE.text = ""
            imputF.text = ""
            imputG.text = ""
            imputH.text = ""
            imputI.text = ""
            imputJ.text = ""
            imputK.text = ""
            imputL.text = ""
            M.text = ""
        }

    
    }
    
    @IBAction func CalculateButtonPressed(sender: UIButton) {
        let MainGroup = pickerData[0][MainGroupSelector.selectedRowInComponent(0)]
        let nValue = pickerData[1][MainGroupSelector.selectedRowInComponent(1)]
        let oppSymbol = pickerData[2][MainGroupSelector.selectedRowInComponent(2)]
        var compoundValue = MainGroup + nValue + oppSymbol
        
        if compoundValue == "Cs"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            
            //A' representation
            var E_A_prime = 1
            var Sigma_h_A_prime = 1
            
            //A" representation
            var E_A_double_prime = 1
            var Sigma_h_A_double_prime = -1
            
            // Cs character table in list form
            var A_prime = [E_A_prime, Sigma_h_A_prime]
            var A_double_prime = [E_A_double_prime, Sigma_h_A_double_prime]
            
            // order of the group (= number of opperations in the group)
            var h_Cs = 2
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_Sigma_h = 1
            
            var N = [N_E, N_Sigma_h]
            
            
            //compute Cs with reduction formula
            var NoofAprime = (1.0/Double(h_Cs)) * (Double(Chi_r_1!) * Double(A_prime[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_prime[1]) * Double(N[1]))
            
            
            var NoofAdoubleprime = (1/Double(h_Cs)) * (Double(Chi_r_1!) * Double(A_double_prime[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_double_prime[1]) * Double(N[1]))
            
            var printNoofAprime = String(format:"%.1f", NoofAprime)
            var printNoofAdoubleprime = String(format:"%.1f", NoofAdoubleprime)
            
            mockLabel.text = String(format:"%.0f", NoofAprime) + "A' + " + String(format:"%.0f", NoofAdoubleprime) + "A''"
            
            mockLabel.textColor = UIColor.blackColor()
            
            var textforLabel = String()
            
            while Double(NoofAprime) != 0.0{
                
                if (NoofAdoubleprime) > 0.0 && (NoofAprime) != 1.0{
                    
                    textforLabel += String(format:"%.0f", NoofAprime) + "A' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (NoofAdoubleprime) > 0.0 && (NoofAprime) == 1.0{
                    
                    textforLabel += "A' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (NoofAdoubleprime) == 0.0 && (NoofAprime) != 1.0{
                    
                    textforLabel += String(format:"%.0f", NoofAprime) + "A'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (NoofAdoubleprime) == 0.0 && (NoofAprime) == 1.0{
                    
                    textforLabel += "A'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(NoofAdoubleprime) != 0.0{
                
                if (NoofAprime) != 1.0{
                    
                    textforLabel += String(format:"%.0f", NoofAdoubleprime) + "A''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (NoofAprime) == 1.0{
                    
                    textforLabel += "A''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while NoofAprime == 0.0 && NoofAdoubleprime == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (NoofAprime - floor(NoofAprime)) > 0.01 || (NoofAdoubleprime - floor(NoofAdoubleprime)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", NoofAprime) + "A' + " + String(format:"%.1f", NoofAdoubleprime) + "A''"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (NoofAprime) < 0.0 || (NoofAdoubleprime) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", NoofAprime) + "A' + " + String(format:"%.1f", NoofAdoubleprime) + "A''"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
        
        }
        
        else if compoundValue == "Ci"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            
            //Ag representation
            var E_Ag = 1
            var i_Ag = 1
            
            // Au representation
            var E_Au = 1
            var i_Au = -1
            
            //Ci character table in list form
            var Ag = [E_Ag, i_Ag]
            var Au = [E_Au, i_Au]
            
            
            //order of the group (= number of opperations in the group)
            var h_Ci = 2
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_i = 1
            
            var N = [N_E, N_i]
            
            //compute using reduction formula
            var No_of_Ag = (1.0/Double(h_Ci)) * (Double(Chi_r_1!) * Double(Ag[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Ag[1]) * Double(N[1]))
            var No_of_Au = (1.0/Double(h_Ci)) * (Double(Chi_r_1!) * Double(Au[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Au[1]) * Double(N[1]))
            
            mockLabel.text = String(format:"%.0f", No_of_Ag) + "Ag + " + String(format:"%.0f", No_of_Au) + "Au"
            
            mockLabel.textColor = UIColor.blackColor()
            
            var textforLabel = String()
            
            while Double(No_of_Ag) != 0.0{
                
                if (No_of_Au) > 0.0 && (No_of_Ag) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au) > 0.0 && (No_of_Ag) == 1.0{
                    
                    textforLabel += "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au) == 0.0 && (No_of_Ag) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au) == 0.0 && (No_of_Ag) == 1.0{
                    
                    textforLabel += "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Au) != 0.0{
                
                if (No_of_Au) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Au) + "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au) == 1.0{
                    
                    textforLabel += "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_Ag == 0.0 && No_of_Ag == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_Ag - floor(No_of_Ag)) > 0.01 || (No_of_Au - floor(No_of_Au)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_Au) + "Au"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_Ag) < 0.0 || (No_of_Au) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_Au) + "Au"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
        }
        
        else if compoundValue == "C₂"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            
            //A representation
            var E_A = 1
            var C2_A = 1
            
            //B representation
            var E_B = 1
            var C2_B = -1
            
            //Cs character table in list form
            var A = [E_A, C2_A]
            var B = [E_B, C2_B]
            
            //order of the group (= number of opperations in the group)
            var h_C2 = 2
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C2 = 1
            
            var N = [N_E, N_C2]
            
            //compute using reduction formula
            var No_of_A = (1.0/Double(h_C2)) * (Double(Chi_r_1!) * Double(A[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A[1]) * Double(N[1]))
            var No_of_B = (1.0/Double(h_C2)) * (Double(Chi_r_1!) * Double(B[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B[1]) * Double(N[1]))
            
            mockLabel.text = String(format:"%.0f", No_of_A) + "A + " + String(format:"%.0f", No_of_B) + "B"
        
            mockLabel.textColor = UIColor.blackColor()
            
            var textforLabel = String()
            
            while Double(No_of_A) != 0.0{
                
                if (No_of_B) > 0.0 && (No_of_A) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A) + "A + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B) > 0.0 && (No_of_A) == 1.0{
                    
                    textforLabel += "A + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B) == 0.0 && (No_of_A) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A) + "A"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B) == 0.0 && (No_of_A) == 1.0{
                    
                    textforLabel += "A"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }

                
                break
                
            }
            
            while Double(No_of_B) != 0.0{
                
                if (No_of_B) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B) + "B"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B) == 1.0{
                    
                    textforLabel += "B"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while No_of_A == 0.0 && No_of_B == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            
            while (No_of_A - floor(No_of_A)) > 0.01 || (No_of_B - floor(No_of_B)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A) + "A + " + String(format:"%.1f", No_of_B) + "B"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_A) < 0.0 || (No_of_B) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A) + "A + " + String(format:"%.1f", No_of_B) + "B"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
        
        }


        else if compoundValue == "D₂"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //A representation
            var E_A = 1
            var C2_z_A = 1
            var C2_y_A = 1
            var C2_x_A = 1
            
            //B1 representation
            var E_B1 = 1
            var C2_z_B1 = 1
            var C2_y_B1 = -1
            var C2_x_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var C2_z_B2 = -1
            var C2_y_B2 = 1
            var C2_x_B2 = -1
            
            //B3 representation
            var E_B3 = 1
            var C2_z_B3 = -1
            var C2_y_B3 = -1
            var C2_x_B3 = 1
            
            //D2 character table in list form
            var A = [E_A, C2_z_A, C2_y_A, C2_x_A]
            var B1 = [E_B1, C2_z_B1, C2_y_B1, C2_x_B1]
            var B2 = [E_B2, C2_z_B2, C2_y_B2, C2_x_B2]
            var B3 = [E_B3, C2_z_B3, C2_y_B3, C2_x_B3]
            
            
            //order of the group (= number of opperations in the group)
            var h_D2 = 4
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C2_z = 1
            var N_C2_y = 1
            var N_C2_x = 1
            
            var N = [N_E, N_C2_z, N_C2_y, N_C2_x]
            
            //compute using reduction formula
            var No_of_A = (1.0/Double(h_D2)) * (Double(Chi_r_1!) * Double(A[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A[3]) * Double(N[3]))
            var No_of_B1 = (1.0/Double(h_D2)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]))
            var No_of_B2 = (1.0/Double(h_D2)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]))
            var No_of_B3 = (1.0/Double(h_D2)) * (Double(Chi_r_1!) * Double(B3[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B3[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B3[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B3[3]) * Double(N[3]))
            
            mockLabel.text = String(format:"%.1f", No_of_A) + "A + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_B3) + "B₃"
            
            mockLabel.textColor = UIColor.blackColor()
            
            var textforLabel = String()
            
            while Double(No_of_A) != 0.0{
                
                if (No_of_B1 + No_of_B2 + No_of_B3) > 0.0 && (No_of_A) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A) + "A + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_B3) > 0.0 && (No_of_A) == 1.0{
                    
                    textforLabel += "A + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_B3) == 0.0 && (No_of_A) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A) + "A"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_B3) == 0.0 && (No_of_A) == 1.0{
                    
                    textforLabel += "A"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2 + No_of_B3) > 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_B3) > 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_B3) == 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_B3) == 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_B3) > 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B3) > 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B3) == 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B3) == 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B3) != 0.0{
                
                if (No_of_B3) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B3) + "B₃"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B3) == 1.0{
                    
                    textforLabel += "B₃"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A == 0.0  && No_of_B1 == 0.0 && No_of_B2 == 0.0 && No_of_B3  == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_A - floor(No_of_A)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01 || (No_of_B3 - floor(No_of_B3)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A) + "A + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_B3) + "B₃"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_A) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0 || (No_of_B3) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A) + "A + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_B3) + "B₃"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
        }
        
        else if compoundValue == "D₃"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2C3_A1 = 1
            var _3C2_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2C3_A2 = 1
            var _3C2_A2 = -1
            
            //E representation
            var E_E = 2
            var _2C3_E = -1
            var _3C2_E = 0
            
            //D3 character table in list form
            var A1 = [E_A1, _2C3_A1, _3C2_A1]
            var A2 = [E_A2, _2C3_A2, _3C2_A2]
            var E = [E_E, _2C3_E, _3C2_E]
            
            
            //order of the group (= number of opperations in the group)
            var h_D3 = 6
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 2
            var N_C2 = 3
            
            var N = [N_E, N_C3, N_C2]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_D3)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]))
            var No_of_A2 = (1.0/Double(h_D3)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]))
            var No_of_E = (1.0/Double(h_D3)) * (Double(Chi_r_1!) * Double(E[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E[2]) * Double(N[2]))
            
            mockLabel.text = String(format:"%.0f", No_of_A1) + "A₁ + " + String(format:"%.0f", No_of_A2) + "A₂ + " + String(format:"%.0f", No_of_E) + "E"
            
            mockLabel.textColor = UIColor.blackColor()
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_E) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_E) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_E) != 0.0{
                
                if No_of_E != 1.0{
                    textforLabel += String(format:"%.0f", No_of_E) + "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E == 1.0{
                    textforLabel += "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                
                break
                
            }
            
            while No_of_A1 == 0.0 && No_of_A2 == 0.0 && No_of_E  == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_E - floor(No_of_E)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_E) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
        }
        
        else if compoundValue == "C₂v"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var C2_A1 = 1
            var Sigma_xz_A1 = 1
            var Sigma_yz_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var C2_A2 = 1
            var Sigma_xz_A2 = -1
            var Sigma_yz_A2 = -1
            
            //B1 representation
            var E_B1 = 1
            var C2_B1 = -1
            var Sigma_xz_B1 = 1
            var Sigma_yz_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var C2_B2 = -1
            var Sigma_xz_B2 = -1
            var Sigma_yz_B2 = 1
            
            //C2v character table in list form
            var A1 = [E_A1, C2_A1, Sigma_xz_A1, Sigma_yz_A1]
            var A2 = [E_A2, C2_A2, Sigma_xz_A2, Sigma_yz_A2]
            var B1 = [E_A1, C2_B1, Sigma_xz_B1, Sigma_yz_B1]
            var B2 = [E_B2, C2_B2, Sigma_xz_B2, Sigma_yz_B2]
            
            //order of the group (= number of opperations in the group)
            var h_C2v = 4
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C2 = 1
            var N_Sigma_xz = 1
            var N_Sigma_yz = 1
            
            var N = [N_E, N_C2, N_Sigma_xz, N_Sigma_yz]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_C2v)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]))
            var No_of_A2 = (1.0/Double(h_C2v)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]))
            var No_of_B1 = (1.0/Double(h_C2v)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]))
            var No_of_B2 = (1.0/Double(h_C2v)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]))
            
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_B1 + No_of_B2) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_B1 + No_of_B2) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2) > 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2) > 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2) == 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2) == 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_B1 == 0.0 && No_of_B2 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }

            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01{
                
                 mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            
        }
        
        else if compoundValue == "C₃v"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2C3_A1 = 1
            var _3Sigma_v_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2C3_A2 = 1
            var _3Sigma_v_A2 = -1
            
            //E representation
            var E_E = 2
            var _2C3_E = -1
            var _3Sigma_v_E = 0
            
            //C3v character table in list form
            var A1 = [E_A1, _2C3_A1, _3Sigma_v_A1]
            var A2 = [E_A2, _2C3_A2, _3Sigma_v_A2]
            var E = [E_E, _2C3_E, _3Sigma_v_E]
            
            //order of the group (= number of opperations in the group)
            var h_C3v = 6
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 2
            var N_Sigma_v = 3
            
            var N = [N_E, N_C3, N_Sigma_v]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_C3v)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]))
            var No_of_A2 = (1.0/Double(h_C3v)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]))
            var No_of_E = (1.0/Double(h_C3v)) * (Double(Chi_r_1!) * Double(E[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E[2]) * Double(N[2]))
        
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E) + "E"
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_E) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_E) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_E) != 0.0{
                
                if No_of_E != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E) + "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if No_of_E == 1.0{
                    
                    textforLabel += "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_E == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_E - floor(No_of_E)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_E) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
        }
        
        else if compoundValue == "C₄v"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2C4_A1 = 1
            var C2_A1 = 1
            var _2Sigma_v_A1 = 1
            var _2Sigma_d_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2C4_A2 = 1
            var C2_A2 = 1
            var _2Sigma_v_A2 = -1
            var _2Sigma_d_A2 = -1
            
            //B1 representation
            var E_B1 = 1
            var _2C4_B1 = -1
            var C2_B1 = 1
            var _2Sigma_v_B1 = 1
            var _2Sigma_d_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var _2C4_B2 = -1
            var C2_B2 = 1
            var _2Sigma_v_B2 = -1
            var _2Sigma_d_B2 = 1
            
            //E representation
            var E_E = 2
            var _2C4_E = 0
            var C2_E = -2
            var _2Sigma_v_E = 0
            var _2Sigma_d_E = 0
            
            //C4v character table in list form
            var A1 = [E_A1, _2C4_A1, C2_A1, _2Sigma_v_A1, _2Sigma_d_A1]
            var A2 = [E_A2, _2C4_A2, C2_A2, _2Sigma_v_A2, _2Sigma_d_A2]
            var B1 = [E_B1, _2C4_B1, C2_B1, _2Sigma_v_B1, _2Sigma_d_B1]
            var B2 = [E_B2, _2C4_B2, C2_B2, _2Sigma_v_B2, _2Sigma_d_B2]
            var E = [E_E, _2C4_E, C2_E, _2Sigma_v_E, _2Sigma_d_E]
            
            //order of the group (= number of opperations in the group)
            var h_C4v = 8
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C4 = 2
            var N_C2 = 1
            var N_Sigma_v = 2
            var N_Sigma_d = 2
            
            var N = [N_E, N_C4, N_C2, N_Sigma_v, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_C4v)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1[4]) * Double(N[4]))
            var No_of_A2 = (1.0/Double(h_C4v)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2[4]) * Double(N[4]))
            var No_of_B1 = (1.0/Double(h_C4v)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1[4]) * Double(N[4]))
            var No_of_B2 = (1.0/Double(h_C4v)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2[4]) * Double(N[4]))
            var No_of_E = (1.0/Double(h_C4v)) * (Double(Chi_r_1!) * Double(E[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E[4]) * Double(N[4]))
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format: "%.1f", No_of_E) + "E"
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2 + No_of_E) > 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) > 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) == 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) == 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_E) > 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) > 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E) != 0.0{
                
                if No_of_E != 1.0{
                   
                    textforLabel += String(format:"%.0f", No_of_E) + "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E == 1.0{
                    
                    textforLabel += "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_B1 == 0.0 && No_of_B2 == 0.0 && No_of_E == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01 || (No_of_E - floor(No_of_E)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0 || (No_of_E) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
        }
        
        else if compoundValue == "C₅v"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2C5_A1 = 1
            var _2C_2_5_A1 = 1
            var _5Sigma_v_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2C5_A2 = 1
            var _2C_2_5_A2 = 1
            var _5Sigma_v_A2 = -1
            
            //E1 representation
            var E_E1 = 2.0
            var _2C5_E1 = tau - 1.0
            var _2C_2_5_E1 = -tau
            var _5Sigma_v_E1 = 0
            
            //E2 representation
            var E_E2 = 2.0
            var _2C5_E2 = -tau
            var _2C_2_5_E2 = tau-1.0
            var _5Sigma_v_E2 = 0
            
            
            //C5v character table in list form
            var A1 = [E_A1, _2C5_A1, _2C_2_5_A1, _5Sigma_v_A1]
            var A2 = [E_A2, _2C5_A2, _2C_2_5_A2, _5Sigma_v_A2]
            var E1 = [E_E1, _2C5_E1, _2C_2_5_E1, _5Sigma_v_E1]
            var E2 = [E_E2, _2C5_E2, _2C_2_5_E2, _5Sigma_v_E2]
            
            //order of the group (= number of opperations in the group)
            var h_C5v = 10
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C5 = 2
            var N_C_2_5 = 2
            var N_Sigma_v = 5
            
            var N = [N_E, N_C5, N_C_2_5, N_Sigma_v]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_C5v)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]))
            var No_of_A2 = (1.0/Double(h_C5v)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]))
            var No_of_E1 = (1.0/Double(h_C5v)) * (Double(Chi_r_1!) * Double(E1[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E1[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E1[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E1[3] as! NSNumber) * Double(N[3]))
            var No_of_E2 = (1.0/Double(h_C5v)) * (Double(Chi_r_1!) * Double(E2[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E2[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E2[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E2[3] as! NSNumber) * Double(N[3]))
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂"
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_E1 + No_of_E2) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E1 + No_of_E2) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E1 + No_of_E2) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_E1 + No_of_E2) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_E1 + No_of_E2) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_E1) != 0.0{
                
                if (No_of_E2) > 0.0 && (No_of_E1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2) > 0.0 && (No_of_E1) == 1.0{
                    
                    textforLabel += "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2) == 0.0 && (No_of_E1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2) == 0.0 && (No_of_E1) == 1.0{
                    
                    textforLabel += "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2) != 0.0{
                
                if No_of_E2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2) + "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if No_of_E2 == 1.0{
                    
                    textforLabel += "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_E1 == 0.0 && No_of_E2 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_E1 - floor(No_of_E1)) > 0.01 || (No_of_E2 - floor(No_of_E2)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
            while (No_of_E1) < 0.0 || (No_of_E2) < 0.0 || (No_of_E1) < 0.0 || (No_of_E2) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
        }
        
        else if compoundValue == "C₆v"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2C6_A1 = 1
            var _2C3_A1 = 1
            var C2_A1 = 1
            var _3Sigma_v_A1 = 1
            var _3Sigma_d_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2C6_A2 = 1
            var _2C3_A2 = 1
            var C2_A2 = 1
            var _3Sigma_v_A2 = -1
            var _3Sigma_d_A2 = -1
            
            //B1 representation
            var E_B1 = 1
            var _2C6_B1 = -1
            var _2C3_B1 = 1
            var C2_B1 = -1
            var _3Sigma_v_B1 = 1
            var _3Sigma_d_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var _2C6_B2 = -1
            var _2C3_B2 = 1
            var C2_B2 = -1
            var _3Sigma_v_B2 = -1
            var _3Sigma_d_B2 = 1
            
            //E1 representation
            var E_E1 = 2
            var _2C6_E1 = 1
            var _2C3_E1 = -1
            var C2_E1 = -2
            var _3Sigma_v_E1 = 0
            var _3Sigma_d_E1 = 0
            
            //E2 representation
            var E_E2 = 2
            var _2C6_E2 = -1
            var _2C3_E2 = -1
            var C2_E2 = 2
            var _3Sigma_v_E2 = 0
            var _3Sigma_d_E2 = 0
            
            //C5v character table in list form
            var A1 = [E_A1, _2C6_A1, _2C3_A1, C2_A1, _3Sigma_v_A1, _3Sigma_d_A1]
            var A2 = [E_A2, _2C6_A2, _2C3_A2, C2_A2, _3Sigma_v_A2, _3Sigma_d_A2]
            var B1 = [E_B1, _2C6_B1, _2C3_B1, C2_B1, _3Sigma_v_B1, _3Sigma_d_B1]
            var B2 = [E_B2, _2C6_B2, _2C3_B2, C2_B2, _3Sigma_v_B2, _3Sigma_d_B2]
            var E1 = [E_E1, _2C6_E1, _2C3_E1, C2_E1, _3Sigma_v_E1, _3Sigma_d_E1]
            var E2 = [E_E2, _2C6_E2, _2C3_E2, C2_E2, _3Sigma_v_E2, _3Sigma_d_E2]
            
            //order of the group (= number of opperations in the group)
            var h_C6v = 12
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C6 = 2
            var N_C3 = 2
            var N_C2 = 1
            var N_Sigma_v = 3
            var N_Sigma_d = 3
            
            var N = [N_E, N_C6, N_C3, N_C2, N_Sigma_v, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1[5]) * Double(N[5]))
            var No_of_A2 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2[5]) * Double(N[5]))
            var No_of_B1 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1[5]) * Double(N[5]))
            var No_of_B2 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2[5]) * Double(N[5]))
            var No_of_E1 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(E1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E1[5]) * Double(N[5]))
            var No_of_E2 = (1.0/Double(h_C6v)) * (Double(Chi_r_1!) * Double(E2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E2[5]) * Double(N[5]))
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ " +
                "+ " + String(format: "%.1f", No_of_E1) + "E₁ + " + String(format: "%.1f", No_of_E2) + "E₂"
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_B1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2) > 0.0 && No_of_B1 == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_B1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2) == 0.0 && No_of_B1 == 1.0{
                    
                    textforLabel += "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_E1 + No_of_E2) > 0.0 && No_of_B2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2) > 0.0 && No_of_B2 == 1.0{
                    
                    textforLabel += "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }

                
                if (No_of_E1 + No_of_E2) == 0.0 && No_of_B2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2) == 0.0 && No_of_B2 == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E1) != 0.0{
                
                if (No_of_E2) > 0.0 && No_of_E1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2) > 0.0 && No_of_E1 == 1.0{
                    
                    textforLabel += "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }

                
                if (No_of_E2) == 0.0 && No_of_E1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2) == 0.0 && No_of_E1 == 1.0{
                    
                    textforLabel += "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2) != 0.0{
                
                if No_of_E2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2) + "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if No_of_E2 == 1.0{
                    
                    textforLabel += "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_B1 == 0.0 && No_of_B2 == 0.0 && No_of_E1 == 0.0 && No_of_E2 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01 || (No_of_E1 - floor(No_of_E1)) > 0.01 || (No_of_E2 - floor(No_of_E2)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0 || (No_of_E1) < 0.0 || (No_of_E2) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂"
                
                mockLabel.textColor = UIColor.redColor()
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
        }
        
        else if compoundValue == "C₂h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            
            //Ag representation
            var E_Ag = 1
            var C2_Ag = 1
            var i_Ag = 1
            var Sigma_h_Ag = 1
            
            //Bg representation
            var E_Bg = 1
            var C2_Bg = -1
            var i_Bg = 1
            var Sigma_h_Bg = -1
            
            //Au representation
            var E_Au = 1
            var C2_Au = 1
            var i_Au = -1
            var Sigma_h_Au = -1
            
            //Bu representation
            var E_Bu = 1
            var C2_Bu = -1
            var i_Bu = -1
            var Sigma_h_Bu = 1
            
            //C2v character table in list form
            var Ag = [E_Ag, C2_Ag, i_Ag, Sigma_h_Ag]
            var Bg = [E_Bg, C2_Bg, i_Bg, Sigma_h_Bg]
            var Au = [E_Au, C2_Au, i_Au, Sigma_h_Au]
            var Bu = [E_Bu, C2_Bu, i_Bu, Sigma_h_Bu]
            
            //order of the group (= number of opperations in the group)
            var h_C2h = 4
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C2 = 1
            var N_i = 1
            var N_Sigma_h = 1
            
            var N = [N_E, N_C2, N_i, N_Sigma_h]
            
            //compute using reduction formula
            var No_of_Ag = (1.0/Double(h_C2h)) * (Double(Chi_r_1!) * Double(Ag[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Ag[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Ag[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Ag[3]) * Double(N[3]))
            var No_of_Bg = (1.0/Double(h_C2h)) * (Double(Chi_r_1!) * Double(Bg[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Bg[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Bg[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Bg[3]) * Double(N[3]))
            var No_of_Au = (1.0/Double(h_C2h)) * (Double(Chi_r_1!) * Double(Au[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Au[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Au[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Au[3]) * Double(N[3]))
            var No_of_Bu = (1.0/Double(h_C2h)) * (Double(Chi_r_1!) * Double(Bu[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Bu[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Bu[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Bu[3]) * Double(N[3]))
            
            mockLabel.text = String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_Bg) + "Bg + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_Bu) + "Bu"
            
            var textforLabel = String()
            
            while Double(No_of_Ag) != 0.0{
                
                if (No_of_Bg + No_of_Au + No_of_Bu) > 0.0 && No_of_Ag != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bg + No_of_Au + No_of_Bu) > 0.0 && No_of_Ag == 1.0{
                    
                    textforLabel += "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bg + No_of_Au + No_of_Bu) == 0.0 && No_of_Ag != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bg + No_of_Au + No_of_Bu) == 0.0 && No_of_Ag == 1.0{
                    
                    textforLabel += "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Bg) != 0.0{
                
                if (No_of_Au + No_of_Bu) > 0.0 && No_of_Bg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Bg) + "Bg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au + No_of_Bu) > 0.0 && No_of_Bg == 1.0{
                    
                    textforLabel += "Bg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au + No_of_Bu) == 0.0 && No_of_Bg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Bg) + "Bg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Au + No_of_Bu) == 0.0 && No_of_Bg == 1.0{
                    
                    textforLabel += "Bg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_Au) != 0.0{
                
                if (No_of_Bu) > 0.0 && No_of_Au != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Au) + "Au + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bu) > 0.0 && No_of_Au == 1.0{
                    
                    textforLabel += "Au + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bu) == 0.0 && No_of_Au != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Au) + "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_Bu) == 0.0 && No_of_Au == 1.0{
                    
                    textforLabel += "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Bu) != 0.0{
                
                if No_of_Bu != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Bu) + "Bu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_Bu == 1.0{
                    
                    textforLabel += "Bu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_Ag == 0.0 && No_of_Bg == 0.0 && No_of_Au == 0.0 && No_of_Bu == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_Ag - floor(No_of_Ag)) > 0.01 || (No_of_Bg - floor(No_of_Bg)) > 0.01 || (No_of_Au - floor(No_of_Au)) > 0.01 || (No_of_Bu - floor(No_of_Bu)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_Bg) + "Bg + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_Bu) + "Bu"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
            
            while (No_of_Ag) < 0.0 || (No_of_Bg) < 0.0 || (No_of_Au) < 0.0 || (No_of_Bu) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_Bg) + "Bg + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_Bu) + "Bu"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
                
            }
        }
        
        else if compoundValue == "D₂h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            
            //Ag representation
            var E_Ag = 1
            var C2_z_Ag = 1
            var C2_y_Ag = 1
            var C2_x_Ag = 1
            var i_Ag = 1
            var Sigma_xy_Ag = 1
            var Sigma_xz_Ag = 1
            var Sigma_yz_Ag = 1
            
            //B1g representation
            var E_B1g = 1
            var C2_z_B1g = 1
            var C2_y_B1g = -1
            var C2_x_B1g = -1
            var i_B1g = 1
            var Sigma_xy_B1g = 1
            var Sigma_xz_B1g = -1
            var Sigma_yz_B1g = -1
            
            //B2g representation
            var E_B2g = 1
            var C2_z_B2g = -1
            var C2_y_B2g = 1
            var C2_x_B2g = -1
            var i_B2g = 1
            var Sigma_xy_B2g = -1
            var Sigma_xz_B2g = 1
            var Sigma_yz_B2g = -1
            
            //B3g representation
            var E_B3g = 1
            var C2_z_B3g = -1
            var C2_y_B3g = -1
            var C2_x_B3g = 1
            var i_B3g = 1
            var Sigma_xy_B3g = -1
            var Sigma_xz_B3g = -1
            var Sigma_yz_B3g = 1
            
            //Au representation
            var E_Au = 1
            var C2_z_Au = 1
            var C2_y_Au = 1
            var C2_x_Au = 1
            var i_Au = -1
            var Sigma_xy_Au = -1
            var Sigma_xz_Au = -1
            var Sigma_yz_Au = -1
            
            //B1u representation
            var E_B1u = 1
            var C2_z_B1u = 1
            var C2_y_B1u = -1
            var C2_x_B1u = -1
            var i_B1u = -1
            var Sigma_xy_B1u = -1
            var Sigma_xz_B1u = 1
            var Sigma_yz_B1u = 1
            
            //B2u representation
            var E_B2u = 1
            var C2_z_B2u = -1
            var C2_y_B2u = 1
            var C2_x_B2u = -1
            var i_B2u = -1
            var Sigma_xy_B2u = 1
            var Sigma_xz_B2u = -1
            var Sigma_yz_B2u = 1
            
            //B3u representation
            var E_B3u = 1
            var C2_z_B3u = -1
            var C2_y_B3u = -1
            var C2_x_B3u = 1
            var i_B3u = -1
            var Sigma_xy_B3u = 1
            var Sigma_xz_B3u = 1
            var Sigma_yz_B3u = -1
            
            //D2h character table in list form
            var Ag = [E_Ag, C2_z_Ag, C2_y_Ag, C2_x_Ag, i_Ag, Sigma_xy_Ag, Sigma_xz_Ag, Sigma_yz_Ag]
            var B1g = [E_B1g, C2_z_B1g, C2_y_B1g, C2_x_B1g, i_B1g, Sigma_xy_B1g, Sigma_xz_B1g, Sigma_yz_B1g]
            var B2g = [E_B2g, C2_z_B2g, C2_y_B2g, C2_x_B2g, i_B2g, Sigma_xy_B2g, Sigma_xz_B2g, Sigma_yz_B2g]
            var B3g = [E_B3g, C2_z_B3g, C2_y_B3g, C2_x_B3g, i_B3g, Sigma_xy_B3g, Sigma_xz_B3g, Sigma_yz_B3g]
            var Au = [E_Au, C2_z_Au, C2_y_Au, C2_x_Au, i_Au, Sigma_xy_Au, Sigma_xz_Au, Sigma_yz_Au]
            var B1u = [E_B1u, C2_z_B1u, C2_y_B1u, C2_x_B1u, i_B1u, Sigma_xy_B1u, Sigma_xz_B1u, Sigma_yz_B1u]
            var B2u = [E_B2u, C2_z_B2u, C2_y_B2u, C2_x_B2u, i_B2u, Sigma_xy_B2u, Sigma_xz_B2u, Sigma_yz_B2u]
            var B3u = [E_B3u, C2_z_B3u, C2_y_B3u, C2_x_B3u, i_B3u, Sigma_xy_B3u, Sigma_xz_B3u, Sigma_yz_B3u]
            
            //order of the group (= number of opperations in the group)
            var h_D2h = 8
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C2_z = 1
            var N_C2_y = 1
            var N_C2_x = 1
            var N_i = 1
            var N_Sigma_xy = 1
            var N_Sigma_xz = 1
            var N_Sigma_yz = 1
            
            var N = [N_E, N_C2_z, N_C2_y, N_C2_x, N_i, N_Sigma_xy, N_Sigma_xz, N_Sigma_yz]
            
            //compute using reduction formula
            var No_of_Ag = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(Ag[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Ag[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Ag[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Ag[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Ag[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Ag[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Ag[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Ag[7]) * Double(N[7]))
            var No_of_B1g = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1g[7]) * Double(N[7]))
            var No_of_B2g = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2g[7]) * Double(N[7]))
            var No_of_B3g = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B3g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B3g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B3g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B3g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B3g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B3g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B3g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B3g[7]) * Double(N[7]))
            var No_of_Au = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(Au[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Au[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Au[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Au[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Au[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Au[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Au[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Au[7]) * Double(N[7]))
            var No_of_B1u = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1u[7]) * Double(N[7]))
            var No_of_B2u = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2u[7]) * Double(N[7]))
            var No_of_B3u = (1.0/Double(h_D2h)) * (Double(Chi_r_1!) * Double(B3u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B3u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B3u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B3u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B3u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B3u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B3u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B3u[7]) * Double(N[7]))
            
            mockLabel.text = String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_B3g) + "B₃g + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_B3u) + "B₃u"
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_Ag) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1g + No_of_B2g + No_of_B3g + No_of_Au + No_of_B1u + No_of_B2u + No_of_B3u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_Ag != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Ag == 1.0{
                    
                    textforLabel += "Ag + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Ag != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Ag) + "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Ag == 1.0{
                    
                    textforLabel += "Ag"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                 break
                
            }
            
            while Double(No_of_B1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2g + No_of_B3g + No_of_Au + No_of_B1u + No_of_B2u + No_of_B3u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                 break
                
            }
            
            while Double(No_of_B2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B3g + No_of_Au + No_of_B1u + No_of_B2u + No_of_B3u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                 break
                
            }
            
            while Double(No_of_B3g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Au + No_of_B1u + No_of_B2u + No_of_B3u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B3g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B3g) + "B₃g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B3g == 1.0{
                    
                    textforLabel += "B₃g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B3g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B3g) + "B₃g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B3g == 1.0{
                    
                    textforLabel += "B₃g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Au) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1u + No_of_B2u + No_of_B3u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_Au != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Au) + "Au + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Au == 1.0{
                    
                    textforLabel += "Au + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Au != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Au) + "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Au == 1.0{
                    
                    textforLabel += "Au"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2u + No_of_B3u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B3u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B3u) != 0.0{
                
                if No_of_B3u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B3u) + "B₃u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_B3u == 1.0{
                    
                    textforLabel += "B₃u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_Ag == 0.0  && No_of_B1g == 0.0 && No_of_B2g == 0.0 && No_of_B3g == 0.0 && No_of_Au == 0.0 && No_of_B1u == 0.0 && No_of_B2u == 0.0 && No_of_B3u == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_Ag - floor(No_of_Ag)) > 0.01 || (No_of_B1g - floor(No_of_B1g)) > 0.01 || (No_of_B2g - floor(No_of_B2g)) > 0.01 || (No_of_B3g - floor(No_of_B3g)) > 0.01 || (No_of_Au - floor(No_of_Au)) > 0.01 || (No_of_B1u - floor(No_of_B1u)) > 0.01 || (No_of_B2u - floor(No_of_B2u)) > 0.01 || (No_of_B3u - floor(No_of_B3u)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_B3g) + "B₃g + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_B3u) + "B₃u"
                
                
                mockLabel.textColor = UIColor.redColor()
            
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_Ag) < 0.0 || (No_of_B1g) < 0.0 || (No_of_B2g) < 0.0 || (No_of_B3g) < 0.0 || (No_of_Au) < 0.0 || (No_of_B1u) < 0.0 || (No_of_B2u) < 0.0 || (No_of_B3u) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_Ag) + "Ag + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_B3g) + "B₃g + " + String(format:"%.1f", No_of_Au) + "Au + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_B3u) + "B₃u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
        }
        
        else if compoundValue == "D₃h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            
            //A'1 representation
            var E_A_prime_1 = 1
            var _2C3_A_prime_1 = 1
            var _3C2_A_prime_1 = 1
            var Sigma_h_A_prime_1 = 1
            var _2S3_A_prime_1 = 1
            var _3Sigma_v_A_prime_1 = 1
            
            //A'2 representation
            var E_A_prime_2 = 1
            var _2C3_A_prime_2 = 1
            var _3C2_A_prime_2 = -1
            var Sigma_h_A_prime_2 = 1
            var _2S3_A_prime_2 = 1
            var _3Sigma_v_A_prime_2 = -1
            
            //E' representation
            var E_E_prime = 2
            var _2C3_E_prime = -1
            var _3C2_E_prime = 0
            var Sigma_h_E_prime = 2
            var _2S3_E_prime = -1
            var _3Sigma_v_E_prime = 0
            
            //A''1 representation
            var E_A_double_prime_1 = 1
            var _2C3_A_double_prime_1 = 1
            var _3C2_A_double_prime_1 = 1
            var Sigma_h_A_double_prime_1 = -1
            var _2S3_A_double_prime_1 = -1
            var _3Sigma_v_A_double_prime_1 = -1
            
            //A''2 representation
            var E_A_double_prime_2 = 1
            var _2C3_A_double_prime_2 = 1
            var _3C2_A_double_prime_2 = -1
            var Sigma_h_A_double_prime_2 = -1
            var _2S3_A_double_prime_2 = -1
            var _3Sigma_v_A_double_prime_2 = 1
            
            //E'' representation
            var E_E_double_prime = 2
            var _2C3_E_double_prime = -1
            var _3C2_E_double_prime = 0
            var Sigma_h_E_double_prime = -2
            var _2S3_E_double_prime = 1
            var _3Sigma_v_E_double_prime = 0
            
            //D3h character table in list form
            var A_prime_1 = [E_A_prime_1, _2C3_A_prime_1, _3C2_A_prime_1, Sigma_h_A_prime_1, _2S3_A_prime_1, _3Sigma_v_A_prime_1]
            var A_prime_2 = [E_A_prime_2, _2C3_A_prime_2, _3C2_A_prime_2, Sigma_h_A_prime_2, _2S3_A_prime_2, _3Sigma_v_A_prime_2]
            var E_prime = [E_E_prime, _2C3_E_prime, _3C2_E_prime, Sigma_h_E_prime, _2S3_E_prime, _3Sigma_v_E_prime]
            var A_double_prime_1 = [E_A_double_prime_1, _2C3_A_double_prime_1, _3C2_A_double_prime_1, Sigma_h_A_double_prime_1, _2S3_A_double_prime_1, _3Sigma_v_A_double_prime_1]
            var A_double_prime_2 = [E_A_double_prime_2, _2C3_A_double_prime_2, _3C2_A_double_prime_2, Sigma_h_A_double_prime_2, _2S3_A_double_prime_2, _3Sigma_v_A_double_prime_2]
            var E_double_prime = [E_E_double_prime, _2C3_E_double_prime, _3C2_E_double_prime, Sigma_h_E_double_prime, _2S3_E_double_prime, _3Sigma_v_E_double_prime]
            
            //order of the group (= number of opperations in the group)
            var h_D3h = 12
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 2
            var N_C2 = 3
            var N_Sigma_h = 1
            var N_S3 = 2
            var N_Sigma_v = 3
            
            var N = [N_E, N_C3, N_C2, N_Sigma_h, N_S3, N_Sigma_v]
            
            //compute using reduction formula
            var No_of_A_prime_1 = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(A_prime_1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_prime_1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_prime_1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_prime_1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_prime_1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_prime_1[5]) * Double(N[5]))
            var No_of_A_prime_2 = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(A_prime_2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_prime_2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_prime_2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_prime_2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_prime_2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_prime_2[5]) * Double(N[5]))
            var No_of_E_prime = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(E_prime[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E_prime[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E_prime[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E_prime[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E_prime[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E_prime[5]) * Double(N[5]))
            var No_of_A_double_prime_1 = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(A_double_prime_1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_double_prime_1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_double_prime_1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_double_prime_1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_double_prime_1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_double_prime_1[5]) * Double(N[5]))
            var No_of_A_double_prime_2 = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(A_double_prime_2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_double_prime_2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_double_prime_2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_double_prime_2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_double_prime_2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_double_prime_2[5]) * Double(N[5]))
            var No_of_E_double_prime = (1.0/Double(h_D3h)) * (Double(Chi_r_1!) * Double(E_double_prime[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E_double_prime[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E_double_prime[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E_double_prime[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E_double_prime[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E_double_prime[5]) * Double(N[5]))
            
            mockLabel.text = String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime) + "E' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime) + "E''"
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_prime_2 + No_of_E_prime + No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_1) + "A₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_prime_1 == 1.0{
                    
                    textforLabel += "A₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_1) + "A₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_1 == 1.0{
                    
                    textforLabel += "A₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_prime_2) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E_prime + No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_2) + "A₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_prime_2 == 1.0{
                    
                    textforLabel += "A₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_2  != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_2) + "A₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_2  == 1.0{
                    
                    textforLabel += "A₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_E_prime) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime) + "E' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime == 1.0{
                    
                    textforLabel += "E' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime) + "E'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime == 1.0{
                    
                    textforLabel += "E'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_double_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_double_prime_2 + No_of_E_double_prime)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_1) + "A₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_1 == 1.0{
                    
                    textforLabel += "A₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_1) + "A₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_1 == 1.0{
                    
                    textforLabel += "A₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_double_prime_2) != 0.0{
                
                var remaingrepresentaionvalues = No_of_E_double_prime
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_2) + "A₂'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_2 == 1.0{
                    
                    textforLabel += "A₂'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_2) + "A₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_2 == 1.0{
                    
                    textforLabel += "A₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E_double_prime) != 0.0{
                
                if No_of_E_double_prime != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_double_prime) + "E''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E_double_prime == 1.0{
                    
                    textforLabel += "E''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A_prime_1 == 0.0  && No_of_A_prime_2 == 0.0 && No_of_E_prime == 0.0 && No_of_A_double_prime_1 == 0.0 && No_of_A_double_prime_2 == 0.0 && No_of_E_double_prime == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A_prime_1 - floor(No_of_A_prime_1)) > 0.01 || (No_of_A_prime_2 - floor(No_of_A_prime_2)) > 0.01 || (No_of_E_prime - floor(No_of_E_prime)) > 0.01 || (No_of_A_double_prime_1 - floor(No_of_A_double_prime_1)) > 0.01 || (No_of_A_double_prime_2 - floor(No_of_A_double_prime_2)) > 0.01 || (No_of_E_double_prime - floor(No_of_E_double_prime)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime) + "E' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime) + "E''"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A_prime_1) < 0.0 || (No_of_A_prime_2) < 0.0 || (No_of_E_prime) < 0.0 || (No_of_A_double_prime_1) < 0.0 || (No_of_A_double_prime_2) < 0.0 || (No_of_E_double_prime) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime) + "E' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime) + "E''"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
        }
        
        else if compoundValue == "D₄h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            let Chi_r_9 = imputI.text.toInt()
            let Chi_r_10 = imputJ.text.toInt()
            
            //A1g representation
            var E_A1g = 1
            var _2C4_A1g = 1
            var C2_A1g = 1
            var _2C2_prime_A1g = 1
            var _2C2_double_prime_A1g = 1
            var i_A1g = 1
            var _2S4_A1g = 1
            var Sigma_h_A1g = 1
            var _2Sigma_v_A1g = 1
            var _2Sigma_d_A1g = 1
            
            //A2g representation
            var E_A2g = 1
            var _2C4_A2g = 1
            var C2_A2g = 1
            var _2C2_prime_A2g = -1
            var _2C2_double_prime_A2g = -1
            var i_A2g = 1
            var _2S4_A2g = 1
            var Sigma_h_A2g = 1
            var _2Sigma_v_A2g = -1
            var _2Sigma_d_A2g = -1
            
            //B1g representation
            var E_B1g = 1
            var _2C4_B1g = -1
            var C2_B1g = 1
            var _2C2_prime_B1g = 1
            var _2C2_double_prime_B1g = -1
            var i_B1g = 1
            var _2S4_B1g = -1
            var Sigma_h_B1g = 1
            var _2Sigma_v_B1g = 1
            var _2Sigma_d_B1g = -1
            
            //B2g representation
            var E_B2g = 1
            var _2C4_B2g = -1
            var C2_B2g = 1
            var _2C2_prime_B2g = -1
            var _2C2_double_prime_B2g = 1
            var i_B2g = 1
            var _2S4_B2g = -1
            var Sigma_h_B2g = 1
            var _2Sigma_v_B2g = -1
            var _2Sigma_d_B2g = 1
            
            //Eg representation
            var E_Eg = 2
            var _2C4_Eg = 0
            var C2_Eg = -2
            var _2C2_prime_Eg = 0
            var _2C2_double_prime_Eg = 0
            var i_Eg = 2
            var _2S4_Eg = 0
            var Sigma_h_Eg = -2
            var _2Sigma_v_Eg = 0
            var _2Sigma_d_Eg = 0
            
            //A1u representation
            var E_A1u = 1
            var _2C4_A1u = 1
            var C2_A1u = 1
            var _2C2_prime_A1u = 1
            var _2C2_double_prime_A1u = 1
            var i_A1u = -1
            var _2S4_A1u = -1
            var Sigma_h_A1u = -1
            var _2Sigma_v_A1u = -1
            var _2Sigma_d_A1u = -1
            
            //A2u representation
            var E_A2u = 1
            var _2C4_A2u = 1
            var C2_A2u = 1
            var _2C2_prime_A2u = -1
            var _2C2_double_prime_A2u = -1
            var i_A2u = -1
            var _2S4_A2u = -1
            var Sigma_h_A2u = -1
            var _2Sigma_v_A2u = 1
            var _2Sigma_d_A2u = 1
            
            //B1u representation
            var E_B1u = 1
            var _2C4_B1u = -1
            var C2_B1u = 1
            var _2C2_prime_B1u = 1
            var _2C2_double_prime_B1u = -1
            var i_B1u = -1
            var _2S4_B1u = 1
            var Sigma_h_B1u = -1
            var _2Sigma_v_B1u = -1
            var _2Sigma_d_B1u = 1
            
            //B2u representation
            var E_B2u = 1
            var _2C4_B2u = -1
            var C2_B2u = 1
            var _2C2_prime_B2u = -1
            var _2C2_double_prime_B2u = 1
            var i_B2u = -1
            var _2S4_B2u = 1
            var Sigma_h_B2u = -1
            var _2Sigma_v_B2u = 1
            var _2Sigma_d_B2u = -1
            
            //Eu representation
            var E_Eu = 2
            var _2C4_Eu = 0
            var C2_Eu = -2
            var _2C2_prime_Eu = 0
            var _2C2_double_prime_Eu = 0
            var i_Eu = -2
            var _2S4_Eu = 0
            var Sigma_h_Eu = 2
            var _2Sigma_v_Eu = 0
            var _2Sigma_d_Eu = 0
            
            //D4h character table in list form
            var A1g = [E_A1g, _2C4_A1g, C2_A1g, _2C2_prime_A1g, _2C2_double_prime_A1g, i_A1g, _2S4_A1g, Sigma_h_A1g, _2Sigma_v_A1g, _2Sigma_d_A1g]
            var A2g = [E_A2g, _2C4_A2g, C2_A2g, _2C2_prime_A2g, _2C2_double_prime_A2g, i_A2g, _2S4_A2g, Sigma_h_A2g, _2Sigma_v_A2g, _2Sigma_d_A2g]
            var B1g = [E_B1g, _2C4_B1g, C2_B1g, _2C2_prime_B1g, _2C2_double_prime_B1g, i_B1g, _2S4_B1g, Sigma_h_B1g, _2Sigma_v_B1g, _2Sigma_d_B1g]
            var B2g = [E_B2g, _2C4_B2g, C2_B2g, _2C2_prime_B2g, _2C2_double_prime_B2g, i_B2g, _2S4_B2g, Sigma_h_B2g, _2Sigma_v_B2g, _2Sigma_d_B2g]
            var Eg = [E_Eg, _2C4_Eg, C2_Eg, _2C2_prime_Eg, _2C2_double_prime_Eg, i_Eg, _2S4_Eg, Sigma_h_Eg, _2Sigma_v_Eg, _2Sigma_d_Eg]
            var A1u = [E_A1u, _2C4_A1u, C2_A1u, _2C2_prime_A1u, _2C2_double_prime_A1u, i_A1u, _2S4_A1u, Sigma_h_A1u, _2Sigma_v_A1u, _2Sigma_d_A1u]
            var A2u = [E_A2u, _2C4_A2u, C2_A2u, _2C2_prime_A2u, _2C2_double_prime_A2u, i_A2u, _2S4_A2u, Sigma_h_A2u, _2Sigma_v_A2u, _2Sigma_d_A2u]
            var B1u = [E_B1u, _2C4_B1u, C2_B1u, _2C2_prime_B1u, _2C2_double_prime_B1u, i_B1u, _2S4_B1u, Sigma_h_B1u, _2Sigma_v_B1u, _2Sigma_d_B1u]
            var B2u = [E_B2u, _2C4_B2u, C2_B2u, _2C2_prime_B2u, _2C2_double_prime_B2u, i_B2u, _2S4_B2u, Sigma_h_B2u, _2Sigma_v_B2u, _2Sigma_d_B2u]
            var Eu = [E_Eu, _2C4_Eu, C2_Eu, _2C2_prime_Eu, _2C2_double_prime_Eu, i_Eu, _2S4_Eu, Sigma_h_Eu, _2Sigma_v_Eu, _2Sigma_d_Eu]
            
            //order of the group (= number of opperations in the group)
            var h_D4h = 16
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C4 = 2
            var N_C2 = 1
            var N_C2_prime = 2
            var N_C2_double_prime = 2
            var N_i = 1
            var N_S4 = 2
            var N_Sigma_h = 1
            var N_Sigma_v = 2
            var N_Sigma_d = 2
            
            var N = [N_E, N_C4, N_C2, N_C2_prime, N_C2_double_prime, N_i, N_S4, N_Sigma_h, N_Sigma_v, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1g = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(A1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1g[9]) * Double(N[9]))
            var No_of_A2g = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(A2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2g[9]) * Double(N[9]))
            var No_of_B1g = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(B1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B1g[9]) * Double(N[9]))
            var No_of_B2g = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(B2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B2g[9]) * Double(N[9]))
            var No_of_Eg = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(Eg[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eg[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eg[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eg[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eg[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eg[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Eg[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Eg[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(Eg[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(Eg[9]) * Double(N[9]))
            var No_of_A1u = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(A1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1u[9]) * Double(N[9]))
            var No_of_A2u = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(A2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2u[9]) * Double(N[9]))
            var No_of_B1u = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(B1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B1u[9]) * Double(N[9]))
            var No_of_B2u = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(B2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B2u[9]) * Double(N[9]))
            var No_of_Eu = (1.0/Double(h_D4h)) * (Double(Chi_r_1!) * Double(Eu[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eu[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eu[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eu[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eu[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eu[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Eu[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Eu[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(Eu[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(Eu[9]) * Double(N[9]))
                
            
            mockLabel.text = String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_Eu) + "Eu"
                
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2g + No_of_B1g + No_of_B2g + No_of_Eg + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1g + No_of_B2g + No_of_Eg + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2g + No_of_Eg + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eg + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eg) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2u + No_of_B1u + No_of_B2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1u + No_of_B2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eu) != 0.0{
                
                if No_of_Eu != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eu) + "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_Eu == 1.0{
                    
                    textforLabel += "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1g == 0.0 && No_of_A2g == 0.0 && No_of_B1g == 0.0 && No_of_B2g == 0.0 && No_of_Eg == 0.0 && No_of_A1u == 0.0 && No_of_A2u == 0.0 && No_of_B1u == 0.0 && No_of_B2u == 0.0 && No_of_Eu == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1g - floor(No_of_A1g)) > 0.01 || (No_of_A2g - floor(No_of_A2g)) > 0.01 || (No_of_B1g - floor(No_of_B1g)) > 0.01 || (No_of_B2g - floor(No_of_B2g)) > 0.01 || (No_of_Eg - floor(No_of_Eg)) > 0.01 || (No_of_A1u - floor(No_of_A1u)) > 0.01 || (No_of_A2u - floor(No_of_A2u)) > 0.01 || (No_of_B1u - floor(No_of_B1u)) > 0.01 || (No_of_B2u - floor(No_of_B2u)) > 0.01 || (No_of_Eu - floor(No_of_Eu)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_Eu) + "Eu"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1g) < 0.0 || (No_of_A2g) < 0.0 || (No_of_B1g) < 0.0 || (No_of_B2g) < 0.0 || (No_of_Eg) < 0.0 || (No_of_A1u) < 0.0 || (No_of_A2u) < 0.0 || (No_of_B1u) < 0.0 || (No_of_B2u) < 0.0 || (No_of_Eu) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_Eu) + "Eu"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
        }
        
        else if compoundValue == "D₅h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            
            //A'1 representation
            var E_A_prime_1 = 1
            var _2C5_A_prime_1 = 1
            var _2C_2_5_A_prime_1 = 1
            var _5C2_prime_A_prime_1 = 1
            var Sigma_h_A_prime_1 = 1
            var _2S5_A_prime_1 = 1
            var _2S_3_5_A_prime_1 = 1
            var _5Sigma_v_A_prime_1 = 1
            
            //A'2 representation
            var E_A_prime_2 = 1
            var _2C5_A_prime_2 = 1
            var _2C_2_5_A_prime_2 = 1
            var _5C2_prime_A_prime_2 = -1
            var Sigma_h_A_prime_2 = 1
            var _2S5_A_prime_2 = 1
            var _2S_3_5_A_prime_2 = 1
            var _5Sigma_v_A_prime_2 = -1
            
            //E'1 representation
            var E_E_prime_1 = 2
            var _2C5_E_prime_1 = tau-1.0
            var _2C_2_5_E_prime_1 = -tau
            var _5C2_prime_E_prime_1 = 0
            var Sigma_h_E_prime_1 = 2
            var _2S5_E_prime_1 = tau-1.0
            var _2S_3_5_E_prime_1 = -tau
            var _5Sigma_v_E_prime_1 = 0
            
            //E'2 representation
            var E_E_prime_2 = 2
            var _2C5_E_prime_2 = -tau
            var _2C_2_5_E_prime_2 = tau-1.0
            var _5C2_prime_E_prime_2 = 0
            var Sigma_h_E_prime_2 = 2
            var _2S5_E_prime_2 = -tau
            var _2S_3_5_E_prime_2 = tau-1.0
            var _5Sigma_v_E_prime_2 = 0
            
            //A''1 representation
            var E_A_double_prime_1 = 1
            var _2C5_A_double_prime_1 = 1
            var _2C_2_5_A_double_prime_1 = 1
            var _5C2_prime_A_double_prime_1 = 1
            var Sigma_h_A_double_prime_1 = -1
            var _2S5_A_double_prime_1 = -1
            var _2S_3_5_A_double_prime_1 = -1
            var _5Sigma_v_A_double_prime_1 = -1
            
            //A''2 representation
            var E_A_double_prime_2 = 1
            var _2C5_A_double_prime_2 = 1
            var _2C_2_5_A_double_prime_2 = 1
            var _5C2_prime_A_double_prime_2 = -1
            var Sigma_h_A_double_prime_2 = -1
            var _2S5_A_double_prime_2 = -1
            var _2S_3_5_A_double_prime_2 = -1
            var _5Sigma_v_A_double_prime_2 = 1
            
            //E''1 representation
            var E_E_double_prime_1 = 2
            var _2C5_E_double_prime_1 = tau-1.0
            var _2C_2_5_E_double_prime_1 = -tau
            var _5C2_prime_E_double_prime_1 = 0
            var Sigma_h_E_double_prime_1 = -2
            var _2S5_E_double_prime_1 = -(tau-1.0)
            var _2S_3_5_E_double_prime_1 = tau
            var _5Sigma_v_E_double_prime_1 = 0
            
            //E''2 representation
            var E_E_double_prime_2 = 2
            var _2C5_E_double_prime_2 = -tau
            var _2C_2_5_E_double_prime_2 = tau-1.0
            var _5C2_prime_E_double_prime_2 = 0
            var Sigma_h_E_double_prime_2 = -2
            var _2S5_E_double_prime_2 = tau
            var _2S_3_5_E_double_prime_2 = -(tau-1.0)
            var _5Sigma_v_E_double_prime_2 = 0
            
            //D5h character table in list form
            var A_prime_1 = [E_A_prime_1, _2C5_A_prime_1, _2C_2_5_A_prime_1, _5C2_prime_A_prime_1, Sigma_h_A_prime_1, _2S5_A_prime_1, _2S_3_5_A_prime_1, _5Sigma_v_A_prime_1]
            var A_prime_2 = [E_A_prime_2, _2C5_A_prime_2, _2C_2_5_A_prime_2, _5C2_prime_A_prime_2, Sigma_h_A_prime_2, _2S5_A_prime_2, _2S_3_5_A_prime_2, _5Sigma_v_A_prime_2]
            var E_prime_1 = [E_E_prime_1, _2C5_E_prime_1, _2C_2_5_E_prime_1, _5C2_prime_E_prime_1, Sigma_h_E_prime_1, _2S5_E_prime_1, _2S_3_5_E_prime_1, _5Sigma_v_E_prime_1]
            var E_prime_2 = [E_E_prime_2, _2C5_E_prime_2, _2C_2_5_E_prime_2, _5C2_prime_E_prime_2, Sigma_h_E_prime_2, _2S5_E_prime_2, _2S_3_5_E_prime_2, _5Sigma_v_E_prime_2]
            var A_double_prime_1 = [E_A_double_prime_1, _2C5_A_double_prime_1, _2C_2_5_A_double_prime_1, _5C2_prime_A_double_prime_1, Sigma_h_A_double_prime_1, _2S5_A_double_prime_1, _2S_3_5_A_double_prime_1, _5Sigma_v_A_double_prime_1]
            var A_double_prime_2 = [E_A_double_prime_2, _2C5_A_double_prime_2, _2C_2_5_A_double_prime_2, _5C2_prime_A_double_prime_2, Sigma_h_A_double_prime_2, _2S5_A_double_prime_2, _2S_3_5_A_double_prime_2, _5Sigma_v_A_double_prime_2]
            var E_double_prime_1 = [E_E_double_prime_1, _2C5_E_double_prime_1, _2C_2_5_E_double_prime_1, _5C2_prime_E_double_prime_1, Sigma_h_E_double_prime_1, _2S5_E_double_prime_1, _2S_3_5_E_double_prime_1, _5Sigma_v_E_double_prime_1]
            var E_double_prime_2 = [E_E_double_prime_2, _2C5_E_double_prime_2, _2C_2_5_E_double_prime_2, _5C2_prime_E_double_prime_2, Sigma_h_E_double_prime_2, _2S5_E_double_prime_2, _2S_3_5_E_double_prime_2, _5Sigma_v_E_double_prime_2]
            
            //order of the group (= number of opperations in the group)
            var h_D5h = 20
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C5 = 2
            var N_C_2_5 = 2
            var N_C2_prime = 5
            var N_Sigma_h = 1
            var N_S5 = 2
            var N_S_3_5 = 2
            var N_Sigma_v = 5
            
            var N = [N_E, N_C5, N_C_2_5, N_C2_prime, N_Sigma_h, N_S5, N_S_3_5, N_Sigma_v]
            
            //compute using reduction formula
            var No_of_A_prime_1 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(A_prime_1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_prime_1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_prime_1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_prime_1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_prime_1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_prime_1[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A_prime_1[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A_prime_1[7]) * Double(N[7]))
            var No_of_A_prime_2 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(A_prime_2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_prime_2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_prime_2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_prime_2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_prime_2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_prime_2[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A_prime_2[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A_prime_2[7]) * Double(N[7]))
            var No_of_E_prime_1 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(E_prime_1[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E_prime_1[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E_prime_1[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E_prime_1[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E_prime_1[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E_prime_1[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E_prime_1[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E_prime_1[7] as! NSNumber) * Double(N[7]))
            var No_of_E_prime_2 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(E_prime_2[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E_prime_1[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E_prime_2[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E_prime_2[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E_prime_2[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E_prime_2[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E_prime_2[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E_prime_2[7] as! NSNumber) * Double(N[7]))
            var No_of_A_double_prime_1 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(A_double_prime_1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_double_prime_1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_double_prime_1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_double_prime_1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_double_prime_1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_double_prime_1[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A_double_prime_1[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A_double_prime_1[7]) * Double(N[7]))
            var No_of_A_double_prime_2 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(A_double_prime_2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A_double_prime_2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A_double_prime_2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A_double_prime_2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A_double_prime_2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A_double_prime_2[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A_double_prime_2[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A_double_prime_2[7]) * Double(N[7]))
            var No_of_E_double_prime_1 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(E_double_prime_1[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E_prime_1[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E_double_prime_1[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E_double_prime_1[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E_double_prime_1[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E_double_prime_1[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E_double_prime_1[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E_double_prime_1[7] as! NSNumber) * Double(N[7]))
            var No_of_E_double_prime_2 = (1.0/Double(h_D5h)) * (Double(Chi_r_1!) * Double(E_double_prime_2[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E_double_prime_1[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E_double_prime_2[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E_double_prime_2[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E_double_prime_2[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E_double_prime_2[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E_double_prime_2[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E_double_prime_2[7] as! NSNumber) * Double(N[7]))
            
            mockLabel.text = String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime_1) + "E₁' + " + String(format: "%.1f", No_of_E_prime_2) + "E₂' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime_1) + "E₁'' + " + String(format: "%.1f", No_of_E_double_prime_2) + "E₂''"
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_prime_2 + No_of_E_prime_1 + No_of_E_prime_2 + No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_1) + "A₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_prime_1 == 1.0{
                    
                    textforLabel += "A₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_1) + "A₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_1 == 1.0{
                    
                    textforLabel += "A₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_prime_2) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E_prime_1 + No_of_E_prime_2 + No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_2) + "A₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_prime_2 == 1.0{
                    
                    textforLabel += "A₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_2  != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_prime_2) + "A₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_prime_2  == 1.0{
                    
                    textforLabel += "A₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_E_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E_prime_2 + No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime_1) + "E₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime_1 == 1.0{
                    
                    textforLabel += "E₁' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime_1) + "E₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime_1 == 1.0{
                    
                    textforLabel += "E₁'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E_prime_2) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_double_prime_1 + No_of_A_double_prime_2 + No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime_2) + "E₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_prime_2 == 1.0{
                    
                    textforLabel += "E₂' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_prime_2) + "E₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_prime_2 == 1.0{
                    
                    textforLabel += "E₂'"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_double_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A_double_prime_2 + No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_1) + "A₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_1 == 1.0{
                    
                    textforLabel += "A₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_1) + "A₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_1 == 1.0{
                    
                    textforLabel += "A₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A_double_prime_2) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E_double_prime_1 + No_of_E_double_prime_2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_2) + "A₂'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A_double_prime_2 == 1.0{
                    
                    textforLabel += "A₂'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A_double_prime_2) + "A₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A_double_prime_2 == 1.0{
                    
                    textforLabel += "A₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E_double_prime_1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E_double_prime_2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_double_prime_1) + "E₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E_double_prime_1 == 1.0{
                    
                    textforLabel += "E₁'' + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_double_prime_1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_double_prime_1) + "E₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E_double_prime_1 == 1.0{
                    
                    textforLabel += "E₁''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E_double_prime_2) != 0.0{
                
                if No_of_E_prime_2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E_double_prime_2) + "E₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E_double_prime_2 == 1.0{
                    
                    textforLabel += "E₂''"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A_prime_1 == 0.0  && No_of_A_prime_2 == 0.0 && No_of_E_prime_1 == 0.0 && No_of_E_prime_2 == 0.0 && No_of_A_double_prime_1 == 0.0 && No_of_A_double_prime_2 == 0.0 && No_of_E_double_prime_1 == 0.0 && No_of_E_double_prime_2 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A_prime_1 - floor(No_of_A_prime_1)) > 0.01 || (No_of_A_prime_2 - floor(No_of_A_prime_2)) > 0.01 || (No_of_E_prime_1 - floor(No_of_E_prime_1)) > 0.01 || (No_of_E_prime_2 - floor(No_of_E_prime_2)) > 0.01 || (No_of_A_double_prime_1 - floor(No_of_A_double_prime_1)) > 0.01 || (No_of_A_double_prime_2 - floor(No_of_A_double_prime_2)) > 0.01 || (No_of_E_double_prime_1 - floor(No_of_E_double_prime_1)) > 0.01 || (No_of_E_double_prime_2 - floor(No_of_E_double_prime_2)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime_1) + "E₁' + " + String(format: "%.1f", No_of_E_prime_2) + "E₂' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime_1) + "E₁'' + " + String(format: "%.1f", No_of_E_double_prime_2) + "E₂''"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A_prime_1) < 0.0 || (No_of_A_prime_2) < 0.0 || (No_of_E_prime_1) < 0.0 || (No_of_E_prime_2) < 0.0 || (No_of_A_double_prime_1) < 0.0 || (No_of_A_double_prime_2) < 0.0 || (No_of_E_double_prime_1) < 0.0 || (No_of_E_double_prime_2) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A_prime_1) + "A₁' + " + String(format:"%.1f", No_of_A_prime_2) + "A₂' + " + String(format: "%.1f", No_of_E_prime_1) + "E₁' + " + String(format: "%.1f", No_of_E_prime_2) + "E₂' + " + String(format:"%.1f", No_of_A_double_prime_1) + "A₁'' + " + String(format:"%.1f", No_of_A_double_prime_2) + "A₂'' + " + String(format: "%.1f", No_of_E_double_prime_1) + "E₁'' + " + String(format: "%.1f", No_of_E_double_prime_2) + "E₂''"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
        }
        
        else if compoundValue == "D₆h"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            let Chi_r_9 = imputI.text.toInt()
            let Chi_r_10 = imputJ.text.toInt()
            let Chi_r_11 = imputK.text.toInt()
            let Chi_r_12 = imputL.text.toInt()
            
            //A1g representation
            var E_A1g = 1
            var _2C6_A1g = 1
            var _2C3_A1g = 1
            var C2_A1g = 1
            var _3C2_prime_A1g = 1
            var _3C2_double_prime_A1g = 1
            var i_A1g = 1
            var _2S3_A1g = 1
            var _2S6_A1g = 1
            var Sigma_h_A1g = 1
            var _3Sigma_d_A1g = 1
            var _3Sigma_v_A1g = 1
            
            //A2g representation
            var E_A2g = 1
            var _2C6_A2g = 1
            var _2C3_A2g = 1
            var C2_A2g = 1
            var _3C2_prime_A2g = -1
            var _3C2_double_prime_A2g = -1
            var i_A2g = 1
            var _2S3_A2g = 1
            var _2S6_A2g = 1
            var Sigma_h_A2g = 1
            var _3Sigma_d_A2g = -1
            var _3Sigma_v_A2g = -1
            
            //B1g representation
            var E_B1g = 1
            var _2C6_B1g = -1
            var _2C3_B1g = 1
            var C2_B1g = -1
            var _3C2_prime_B1g = 1
            var _3C2_double_prime_B1g = -1
            var i_B1g = 1
            var _2S3_B1g = -1
            var _2S6_B1g = 1
            var Sigma_h_B1g = -1
            var _3Sigma_d_B1g = 1
            var _3Sigma_v_B1g = -1
            
            //B2g representation
            var E_B2g = 1
            var _2C6_B2g = -1
            var _2C3_B2g = 1
            var C2_B2g = -1
            var _3C2_prime_B2g = -1
            var _3C2_double_prime_B2g = 1
            var i_B2g = 1
            var _2S3_B2g = -1
            var _2S6_B2g = 1
            var Sigma_h_B2g = -1
            var _3Sigma_d_B2g = -1
            var _3Sigma_v_B2g = 1
            
            //E1g representation
            var E_E1g = 2
            var _2C6_E1g = 1
            var _2C3_E1g = -1
            var C2_E1g = -2
            var _3C2_prime_E1g = 0
            var _3C2_double_prime_E1g = 0
            var i_E1g = 2
            var _2S3_E1g = 1
            var _2S6_E1g = -1
            var Sigma_h_E1g = -2
            var _3Sigma_d_E1g = 0
            var _3Sigma_v_E1g = 0
            
            //E2g representation
            var E_E2g = 2
            var _2C6_E2g = -1
            var _2C3_E2g = -1
            var C2_E2g = 2
            var _3C2_prime_E2g = 0
            var _3C2_double_prime_E2g = 0
            var i_E2g = 2
            var _2S3_E2g = -1
            var _2S6_E2g = -1
            var Sigma_h_E2g = 2
            var _3Sigma_d_E2g = 0
            var _3Sigma_v_E2g = 0
            
            //A1u representation
            var E_A1u = 1
            var _2C6_A1u = 1
            var _2C3_A1u = 1
            var C2_A1u = 1
            var _3C2_prime_A1u = 1
            var _3C2_double_prime_A1u = 1
            var i_A1u = -1
            var _2S3_A1u = -1
            var _2S6_A1u = -1
            var Sigma_h_A1u = -1
            var _3Sigma_d_A1u = -1
            var _3Sigma_v_A1u = -1
            
            //A2u representation
            var E_A2u = 1
            var _2C6_A2u = 1
            var _2C3_A2u = 1
            var C2_A2u = 1
            var _3C2_prime_A2u = -1
            var _3C2_double_prime_A2u = -1
            var i_A2u = -1
            var _2S3_A2u = -1
            var _2S6_A2u = -1
            var Sigma_h_A2u = -1
            var _3Sigma_d_A2u = 1
            var _3Sigma_v_A2u = 1
            
            //B1u representation
            var E_B1u = 1
            var _2C6_B1u = -1
            var _2C3_B1u = 1
            var C2_B1u = -1
            var _3C2_prime_B1u = 1
            var _3C2_double_prime_B1u = -1
            var i_B1u = -1
            var _2S3_B1u = 1
            var _2S6_B1u = -1
            var Sigma_h_B1u = 1
            var _3Sigma_d_B1u = -1
            var _3Sigma_v_B1u = 1
            
            //B2u representation
            var E_B2u = 1
            var _2C6_B2u = -1
            var _2C3_B2u = 1
            var C2_B2u = -1
            var _3C2_prime_B2u = -1
            var _3C2_double_prime_B2u = 1
            var i_B2u = -1
            var _2S3_B2u = 1
            var _2S6_B2u = -1
            var Sigma_h_B2u = 1
            var _3Sigma_d_B2u = 1
            var _3Sigma_v_B2u = -1
            
            //E1u representation
            var E_E1u = 2
            var _2C6_E1u = 1
            var _2C3_E1u = -1
            var C2_E1u = -2
            var _3C2_prime_E1u = 0
            var _3C2_double_prime_E1u = 0
            var i_E1u = -2
            var _2S3_E1u = -1
            var _2S6_E1u = 1
            var Sigma_h_E1u = 2
            var _3Sigma_d_E1u = 0
            var _3Sigma_v_E1u = 0
            
            //E2u representation
            var E_E2u = 2
            var _2C6_E2u = -1
            var _2C3_E2u = -1
            var C2_E2u = 2
            var _3C2_prime_E2u = 0
            var _3C2_double_prime_E2u = 0
            var i_E2u = -2
            var _2S3_E2u = 1
            var _2S6_E2u = 1
            var Sigma_h_E2u = -2
            var _3Sigma_d_E2u = 0
            var _3Sigma_v_E2u = 0
            
            
            //D6h character table in list form
            var A1g = [E_A1g, _2C6_A1g, _2C3_A1g, C2_A1g, _3C2_prime_A1g, _3C2_double_prime_A1g, i_A1g, _2S3_A1g, _2S6_A1g, Sigma_h_A1g, _3Sigma_d_A1g, _3Sigma_v_A1g]
            var A2g = [E_A2g, _2C6_A2g, _2C3_A2g, C2_A2g, _3C2_prime_A2g, _3C2_double_prime_A2g, i_A2g, _2S3_A2g, _2S6_A2g, Sigma_h_A2g, _3Sigma_d_A2g, _3Sigma_v_A2g]
            var B1g = [E_B1g, _2C6_B1g, _2C3_B1g, C2_B1g, _3C2_prime_B1g, _3C2_double_prime_B1g, i_B1g, _2S3_B1g, _2S6_B1g, Sigma_h_B1g, _3Sigma_d_B1g, _3Sigma_v_B1g]
            var B2g = [E_B2g, _2C6_B2g, _2C3_B2g, C2_B2g, _3C2_prime_B2g, _3C2_double_prime_B2g, i_B2g, _2S3_B2g, _2S6_B2g, Sigma_h_B2g, _3Sigma_d_B2g, _3Sigma_v_B2g]
            var E1g = [E_E1g, _2C6_E1g, _2C3_E1g, C2_E1g, _3C2_prime_E1g, _3C2_double_prime_E1g, i_E1g, _2S3_E1g, _2S6_E1g, Sigma_h_E1g, _3Sigma_d_E1g, _3Sigma_v_E1g]
            var E2g = [E_E2g, _2C6_E2g, _2C3_E2g, C2_E2g, _3C2_prime_E2g, _3C2_double_prime_E2g, i_E2g, _2S3_E2g, _2S6_E2g, Sigma_h_E2g, _3Sigma_d_E2g, _3Sigma_v_E2g]
            var A1u = [E_A1u, _2C6_A1u, _2C3_A1u, C2_A1u, _3C2_prime_A1u, _3C2_double_prime_A1u, i_A1u, _2S3_A1u, _2S6_A1u, Sigma_h_A1u, _3Sigma_d_A1u, _3Sigma_v_A1u]
            var A2u = [E_A2u, _2C6_A2u, _2C3_A2u, C2_A2u, _3C2_prime_A2u, _3C2_double_prime_A2u, i_A2u, _2S3_A2u, _2S6_A2u, Sigma_h_A2u, _3Sigma_d_A2u, _3Sigma_v_A2u]
            var B1u = [E_B1u, _2C6_B1u, _2C3_B1u, C2_B1u, _3C2_prime_B1u, _3C2_double_prime_B1u, i_B1u, _2S3_B1u, _2S6_B1u, Sigma_h_B1u, _3Sigma_d_B1u, _3Sigma_v_B1u]
            var B2u = [E_B2u, _2C6_B2u, _2C3_B2u, C2_B2u, _3C2_prime_B2u, _3C2_double_prime_B2u, i_B2u, _2S3_B2u, _2S6_B2u, Sigma_h_B2u, _3Sigma_d_B2u, _3Sigma_v_B2u]
            var E1u = [E_E1u, _2C6_E1u, _2C3_E1u, C2_E1u, _3C2_prime_E1u, _3C2_double_prime_E1u, i_E1u, _2S3_E1u, _2S6_E1u, Sigma_h_E1u, _3Sigma_d_E1u, _3Sigma_v_E1u]
            var E2u = [E_E2u, _2C6_E2u, _2C3_E2u, C2_E2u, _3C2_prime_E2u, _3C2_double_prime_E2u, i_E2u, _2S3_E2u, _2S6_E2u, Sigma_h_E2u, _3Sigma_d_E2u, _3Sigma_v_E2u]
            
            
            //order of the group (= number of opperations in the group)
            var h_D6h = 24
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C6 = 2
            var N_C3 = 2
            var N_C2 = 1
            var N_C2_prime = 3
            var N_C2_double_prime = 3
            var N_i = 1
            var N_S3 = 2
            var N_S6 = 2
            var N_Sigma_h = 1
            var N_Sigma_v = 3
            var N_Sigma_d = 3
            
            var N = [N_E, N_C6, N_C3, N_C2, N_C2_prime, N_C2_double_prime, N_i, N_S3, N_S6, N_Sigma_h, N_Sigma_v, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(A1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(A1g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(A1g[11]) * Double(N[11]))
            var No_of_A2g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(A2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(A2g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(A2g[11]) * Double(N[11]))
            var No_of_B1g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(B1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B1g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(B1g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(B1g[11]) * Double(N[11]))
            var No_of_B2g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(B2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B2g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(B2g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(B2g[11]) * Double(N[11]))
            var No_of_E1g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(E1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(E1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(E1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(E1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(E1g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(E1g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(E1g[11]) * Double(N[11]))
            var No_of_E2g = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(E2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(E2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(E2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(E2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(E2g[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(E2g[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(E2g[11]) * Double(N[11]))
            var No_of_A1u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(A1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(A1u[11]) * Double(N[10]) + Double(Chi_r_12!) * Double(A1u[11]) * Double(N[11]))
            var No_of_A2u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(A2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(A2u[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(A2u[11]) * Double(N[11]))
            var No_of_B1u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(B1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B1u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(B1u[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(B1u[11]) * Double(N[11]))
            var No_of_B2u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(B2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(B2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(B2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(B2u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(B2u[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(B2u[11]) * Double(N[11]))
            var No_of_E1u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(E1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(E1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(E1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(E1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(E1u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(E1u[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(E1u[11]) * Double(N[11]))
            var No_of_E2u = (1.0/Double(h_D6h)) * (Double(Chi_r_1!) * Double(E2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(E2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(E2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(E2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(E2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(E2u[9]) * Double(N[9]) + Double(Chi_r_11!) * Double(E2u[10]) * Double(N[10]) + Double(Chi_r_12!) * Double(E2u[11]) * Double(N[11]))
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
            
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2g + No_of_B1g + No_of_B2g + No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1g + No_of_B2g + No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2g + No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1g) + "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1g == 1.0{
                    
                    textforLabel += "B₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2g) + "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2g == 1.0{
                    
                    textforLabel += "B₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E2g + No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1g) + "E₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1g == 1.0{
                    
                    textforLabel += "E₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1g) + "E₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1g == 1.0{
                    
                    textforLabel += "E₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A1u + No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2g) + "E₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E2g == 1.0{
                    
                    textforLabel += "E₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2g) + "E₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E2g == 1.0{
                    
                    textforLabel += "E₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2u + No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B1u + No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_B2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1u) + "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B1u == 1.0{
                    
                    textforLabel += "B₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2u) + "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_B2u == 1.0{
                    
                    textforLabel += "B₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1u) + "E₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1u == 1.0{
                    
                    textforLabel += "E₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1u) + "E₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1u == 1.0{
                    
                    textforLabel += "E₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2g) != 0.0{
                
                if No_of_E2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2u) + "E₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E2u == 1.0{
                    
                    textforLabel += "E₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1g == 0.0 && No_of_A2g == 0.0 && No_of_B1g == 0.0 && No_of_B2g == 0.0 && No_of_E1g == 0.0 && No_of_E2g == 0.0 && No_of_A1u == 0.0 && No_of_A2u == 0.0 && No_of_B1u == 0.0 && No_of_B2u == 0.0 && No_of_E1u == 0.0 && No_of_E2u == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1g - floor(No_of_A1g)) > 0.01 || (No_of_A2g - floor(No_of_A2g)) > 0.01 || (No_of_B1g - floor(No_of_B1g)) > 0.01 || (No_of_B2g - floor(No_of_B2g)) > 0.01 || (No_of_E1g - floor(No_of_E1g)) > 0.01 || (No_of_E2g - floor(No_of_E2g)) > 0.01 || (No_of_A1u - floor(No_of_A1u)) > 0.01 || (No_of_A2u - floor(No_of_A2u)) > 0.01 || (No_of_B1u - floor(No_of_B1u)) > 0.01 || (No_of_B2u - floor(No_of_B2u)) > 0.01 || (No_of_E1u - floor(No_of_E1u)) > 0.01 || (No_of_E2u - floor(No_of_E2u)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1g) < 0.0 || (No_of_A2g) < 0.0 || (No_of_B1g) < 0.0 || (No_of_B2g) < 0.0 || (No_of_E1g) < 0.0 || (No_of_E2g) < 0.0 || (No_of_A1u) < 0.0 || (No_of_A2u) < 0.0 || (No_of_B1u) < 0.0 || (No_of_B2u) < 0.0 || (No_of_E1u) < 0.0 || (No_of_E2u) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_B1g) + "B₁g + " + String(format:"%.1f", No_of_B2g) + "B₂g " + "+ " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_B1u) + "B₁u + " + String(format:"%.1f", No_of_B2u) + "B₂u " + "+ " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
        }
        
        else if compoundValue == "D₂d"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2S4_A1 = 1
            var C2_A1 = 1
            var _2C2_prime_A1 = 1
            var _2Sigma_d_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2S4_A2 = 1
            var C2_A2 = 1
            var _2C2_prime_A2 = -1
            var _2Sigma_d_A2 = -1
            
            //B1 representation
            var E_B1 = 1
            var _2S4_B1 = -1
            var C2_B1 = 1
            var _2C2_prime_B1 = 1
            var _2Sigma_d_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var _2S4_B2 = -1
            var C2_B2 = 1
            var _2C2_prime_B2 = -1
            var _2Sigma_d_B2 = 1
            
            //E representation
            var E_E = 2
            var _2S4_E = 0
            var C2_E = -2
            var _2C2_prime_E = 0
            var _2Sigma_d_E = 0
            
            
            //D2d character table in list form
            var A1 = [E_A1, _2S4_A1, C2_A1, _2C2_prime_A1, _2Sigma_d_A1]
            var A2 = [E_A2, _2S4_A2, C2_A2, _2C2_prime_A2, _2Sigma_d_A2]
            var B1 = [E_B1, _2S4_B1, C2_B1, _2C2_prime_B1, _2Sigma_d_B1]
            var B2 = [E_B2, _2S4_B2, C2_B2, _2C2_prime_B2, _2Sigma_d_B2]
            var E = [E_E, _2S4_E, C2_E, _2C2_prime_E, _2Sigma_d_E]
            
            //order of the group (= number of opperations in the group)
            var h_D2d = 8
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_S4 = 2
            var N_C2 = 1
            var N_C2_prime = 2
            var N_Sigma_d = 2
            
            var N = [N_E, N_S4, N_C2, N_C2_prime, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_D2d)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1[4]) * Double(N[4]))
            var No_of_A2 = (1.0/Double(h_D2d)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2[4]) * Double(N[4]))
            var No_of_B1 = (1.0/Double(h_D2d)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1[4]) * Double(N[4]))
            var No_of_B2 = (1.0/Double(h_D2d)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2[4]) * Double(N[4]))
            var No_of_E = (1.0/Double(h_D2d)) * (Double(Chi_r_1!) * Double(E[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E[4]) * Double(N[4]))
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format: "%.1f", No_of_E) + "E"
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A1) == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) > 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E) == 0.0 && (No_of_A2) == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2 + No_of_E) > 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) > 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) == 0.0 && (No_of_B1) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E) == 0.0 && (No_of_B1) == 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_E) > 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) > 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_B2) != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E) == 0.0 && (No_of_B2) == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E) != 0.0{
                
                if No_of_E != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E) + "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E == 1.0{
                    
                    textforLabel += "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_B1 == 0.0 && No_of_B2 == 0.0 && No_of_E == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01 || (No_of_E - floor(No_of_E)) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0 || (No_of_E) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E) + "E"
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
        }
        
        else if compoundValue == "D₃d"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            let Chi_r_9 = imputI.text.toInt()
            let Chi_r_10 = imputJ.text.toInt()
            
            //A1g representation
            var E_A1g = 1
            var _2C3_A1g = 1
            var _3C2_prime_A1g = 1
            var i_A1g = 1
            var _2S6_A1g = 1
            var _3Sigma_d_A1g = 1
            
            //A2g representation
            var E_A2g = 1
            var _2C3_A2g = 1
            var _3C2_prime_A2g = -1
            var i_A2g = 1
            var _2S6_A2g = 1
            var _3Sigma_d_A2g = -1
            
            //Eg representation
            var E_Eg = 2
            var _2C3_Eg = -1
            var _3C2_prime_Eg = 0
            var i_Eg = 2
            var _2S6_Eg = -1
            var _3Sigma_d_Eg = 0
            
            //A1u representation
            var E_A1u = 1
            var _2C3_A1u = 1
            var _3C2_prime_A1u = 1
            var i_A1u = -1
            var _2S6_A1u = -1
            var _3Sigma_d_A1u = -1
            
            //A2u representation
            var E_A2u = 1
            var _2C3_A2u = 1
            var _3C2_prime_A2u = -1
            var i_A2u = -1
            var _2S6_A2u = -1
            var _3Sigma_d_A2u = 1
            
            //Eu representation
            var E_Eu = 2
            var _2C3_Eu = -1
            var _3C2_prime_Eu = 0
            var i_Eu = -2
            var _2S6_Eu = 1
            var _3Sigma_d_Eu = 0
            
            //D3d character table in list form
            var A1g = [E_A1g, _2C3_A1g, _3C2_prime_A1g, i_A1g, _2S6_A1g, _3Sigma_d_A1g]
            var A2g = [E_A2g, _2C3_A2g, _3C2_prime_A2g, i_A2g, _2S6_A2g, _3Sigma_d_A2g]
            var Eg = [E_Eg, _2C3_Eg, _3C2_prime_Eg, i_Eg, _2S6_Eg, _3Sigma_d_Eg]
            var A1u = [E_A1u, _2C3_A1u, _3C2_prime_A1u, i_A1u, _2S6_A1u, _3Sigma_d_A1u]
            var A2u = [E_A2u, _2C3_A2u, _3C2_prime_A2u, i_A2u, _2S6_A2u, _3Sigma_d_A2u]
            var Eu = [E_Eu, _2C3_Eu, _3C2_prime_Eu, i_Eu, _2S6_Eu, _3Sigma_d_Eu]
            
            
            //order of the group (= number of opperations in the group)
            var h_D3d = 12
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 2
            var N_C2_prime = 3
            var N_i = 1
            var N_S6 = 2
            var N_Sigma_d = 3
            
            var N = [N_E, N_C3, N_C2_prime, N_i, N_S6, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1g = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(A1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1g[5]) * Double(N[5]))
            var No_of_A2g = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(A2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2g[5]) * Double(N[5]))
            var No_of_Eg = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(Eg[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eg[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eg[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eg[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eg[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eg[5]) * Double(N[5]))
            var No_of_A1u = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(A1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1u[5]) * Double(N[5]))
            var No_of_A2u = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(A2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2u[5]) * Double(N[5]))
            var No_of_Eu = (1.0/Double(h_D3d)) * (Double(Chi_r_1!) * Double(Eu[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eu[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eu[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eu[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eu[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eu[5]) * Double(N[5]))
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_Eu) + "Eu"
            
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2g + No_of_Eg + No_of_A1u + No_of_A2u + No_of_Eu)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eg + No_of_A1u + No_of_A2u + No_of_Eu)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eg) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A1u + No_of_A2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2u + No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eu)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eu) != 0.0{
                
                if No_of_Eu != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eu) + "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_Eu == 1.0{
                    
                    textforLabel += "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1g == 0.0 && No_of_A2g == 0.0 && No_of_Eg == 0.0 && No_of_A1u == 0.0 && No_of_A2u == 0.0 && No_of_Eu == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1g - floor(No_of_A1g)) > 0.01 || (No_of_A2g - floor(No_of_A2g)) > 0.01 || (No_of_Eg - floor(No_of_Eg)) > 0.01 || (No_of_A1u - floor(No_of_A1u)) > 0.01 || (No_of_A2u - floor(No_of_A2u)) > 0.01 || (No_of_Eu - floor(No_of_Eu)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_Eu) + "Eu"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1g) < 0.0 || (No_of_A2g) < 0.0 || (No_of_Eg) < 0.0 || (No_of_A1u) < 0.0 || (No_of_A2u) < 0.0 || (No_of_Eu) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_Eu) + "Eu"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
        }
        
        else if compoundValue == "D₄d"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _2S8_A1 = 1
            var _2C4_A1 = 1
            var _2S8_3_A1 = 1
            var C2_A1 = 1
            var _4C2_prime_A1 = 1
            var _4Sigma_d_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _2S8_A2 = 1
            var _2C4_A2 = 1
            var _2S8_3_A2 = 1
            var C2_A2 = 1
            var _4C2_prime_A2 = -1
            var _4Sigma_d_A2 = -1
            
            //B1 representation
            var E_B1 = 1
            var _2S8_B1 = -1
            var _2C4_B1 = 1
            var _2S8_3_B1 = -1
            var C2_B1 = 1
            var _4C2_prime_B1 = 1
            var _4Sigma_d_B1 = -1
            
            //B2 representation
            var E_B2 = 1
            var _2S8_B2 = -1
            var _2C4_B2 = 1
            var _2S8_3_B2 = -1
            var C2_B2 = 1
            var _4C2_prime_B2 = -1
            var _4Sigma_d_B2 = 1
            
            //E1 representation
            var E_E1 = 2
            var _2S8_E1 = sqrt(2.0)
            var _2C4_E1 = 0
            var _2S8_3_E1 = -sqrt(2.0)
            var C2_E1 = -2
            var _4C2_prime_E1 = 0
            var _4Sigma_d_E1 = 0
            
            //E2 representation
            var E_E2 = 2
            var _2S8_E2 = 0
            var _2C4_E2 = -2
            var _2S8_3_E2 = 0
            var C2_E2 = 2
            var _4C2_prime_E2 = 0
            var _4Sigma_d_E2 = 0
            
            //E3 representation
            var E_E3 = 2
            var _2S8_E3 = -sqrt(2.0)
            var _2C4_E3 = 0
            var _2S8_3_E3 = sqrt(2.0)
            var C2_E3 = -2
            var _4C2_prime_E3 = 0
            var _4Sigma_d_E3 = 0
            
            
            //D4d character table in list form
            var A1 = [E_A1, _2S8_A1, _2C4_A1, _2S8_3_A1, C2_A1, _4C2_prime_A1, _4Sigma_d_A1]
            var A2 = [E_A2, _2S8_A2, _2C4_A2, _2S8_3_A2, C2_A2, _4C2_prime_A2, _4Sigma_d_A2]
            var B1 = [E_B1, _2S8_B1, _2C4_B1, _2S8_3_B1, C2_B1, _4C2_prime_B1, _4Sigma_d_B1]
            var B2 = [E_B2, _2S8_B2, _2C4_B2, _2S8_3_B2, C2_B2, _4C2_prime_B2, _4Sigma_d_B2]
            var E1 = [E_E1, _2S8_E1, _2C4_E1, _2S8_3_E1, C2_E1, _4C2_prime_E1, _4Sigma_d_E1]
            var E2 = [E_E2, _2S8_E2, _2C4_E2, _2S8_3_E2, C2_E2, _4C2_prime_E2, _4Sigma_d_E2]
            var E3 = [E_E3, _2S8_E3, _2C4_E3, _2S8_3_E3, C2_E3, _4C2_prime_E3, _4Sigma_d_E3]
            
            //order of the group (= number of opperations in the group)
            var h_D4d = 16
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_S8 = 2
            var N_C4 = 2
            var N_S8_3 = 2
            var N_C2 = 1
            var N_C2_prime = 4
            var N_Sigma_d = 4
            
            var N = [N_E, N_S8, N_C4, N_S8_3, N_C2, N_C2_prime, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1[6]) * Double(N[6]))
            var No_of_A2 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2[6]) * Double(N[6]))
            var No_of_B1 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(B1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B1[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B1[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B1[6]) * Double(N[6]))
            var No_of_B2 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(B2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(B2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(B2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(B2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(B2[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(B2[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(B2[6]) * Double(N[6]))
            var No_of_E1 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(E1[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E1[1]as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E1[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E1[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E1[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E1[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E1[6] as! NSNumber) * Double(N[6]))
            var No_of_E2 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(E2[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E2[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E2[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E2[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E2[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E2[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E2[6] as! NSNumber) * Double(N[6]))
            var No_of_E3 = (1.0/Double(h_D4d)) * (Double(Chi_r_1!) * Double(E3[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E3[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E3[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E3[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E3[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E3[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E3[6] as! NSNumber) * Double(N[6]))
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ " + "+ " + String(format: "%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂ " + "+ " + String(format: "%.1f", No_of_E3) + "E₃"
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2 + No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B1 + No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            while Double(No_of_B1) != 0.0{
                
                if (No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_B1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_B1 == 1.0{
                    
                    textforLabel += "B₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_B1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B1) + "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_B2 + No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_B1 == 1.0{
                    
                    textforLabel += "B₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_B2) != 0.0{
                
                if (No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_B2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2 + No_of_E3) > 0.0 && No_of_B2 == 1.0{
                    
                    textforLabel += "B₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                if (No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_B2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_B2) + "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E1 + No_of_E2 + No_of_E3) == 0.0 && No_of_B2 == 1.0{
                    
                    textforLabel += "B₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E1) != 0.0{
                
                if (No_of_E2 + No_of_E3) > 0.0 && No_of_E1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2 + No_of_E3) > 0.0 && No_of_E1 == 1.0{
                    
                    textforLabel += "E₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                if (No_of_E2 + No_of_E3) == 0.0 && No_of_E1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1) + "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if (No_of_E2 + No_of_E3) == 0.0 && No_of_E1 == 1.0{
                    
                    textforLabel += "E₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2) != 0.0{
                
                if (No_of_E3) > 0.0 && No_of_E2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2) + "E₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if (No_of_E3) == 0.0 && No_of_E2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2) + "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if (No_of_E3) > 0.0 && No_of_E2 == 1.0{
                    
                    textforLabel += "E₂ +"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                if (No_of_E3) == 0.0 && No_of_E2 == 1.0{
                    
                    textforLabel += "E₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                break
            }
            
            while Double(No_of_E3) != 0.0{
                
                if No_of_E3 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2) + "E₃"
                    
                    mockLabel.text = textforLabel
                
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                    
                
                if No_of_E3 == 1.0{
                
                    textforLabel += "E₃"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                    
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0  && No_of_A2 == 0.0 && No_of_B1 == 0.0 && No_of_B2 == 0.0 && No_of_E1 == 0.0 && No_of_E2 == 0.0 && No_of_E3 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_B1 - floor(No_of_B1)) > 0.01 || (No_of_B2 - floor(No_of_B2)) > 0.01 || (No_of_E1 - floor(No_of_E1)) > 0.01 || (No_of_E2 - floor(No_of_E2)) > 0.01 || (No_of_E3 - floor(No_of_E3 )) > 0.01{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂ + " + String(format:"%.1f", No_of_E2) + "E₃"
                
                mockLabel.textColor = UIColor.redColor()
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_B1) < 0.0 || (No_of_B2) < 0.0 || (No_of_E1) < 0.0 || (No_of_E2) < 0.0 || (No_of_E3) < 0.0{
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format:"%.1f", No_of_B1) + "B₁ + " + String(format:"%.1f", No_of_B2) + "B₂ + " + String(format:"%.1f", No_of_E1) + "E₁ + " + String(format:"%.1f", No_of_E2) + "E₂ + " + String(format:"%.1f", No_of_E2) + "E₃"
                
                mockLabel.textColor = UIColor.redColor()
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                break
                
            }
        }
        
        else if compoundValue == "D₅d"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            let Chi_r_9 = imputI.text.toInt()
            let Chi_r_10 = imputJ.text.toInt()
            let Chi_r_11 = imputK.text.toInt()
            let Chi_r_12 = imputL.text.toInt()
            
            //A1g representation
            var E_A1g = 1
            var _2C5_A1g = 1
            var _2C5_2_A1g = 1
            var _5C2_A1g = 1
            var i_A1g = 1
            var _2S10_3_A1g = 1
            var _2S10_A1g = 1
            var _5Sigma_d_A1g = 1
            
            //A2g representation
            var E_A2g = 1
            var _2C5_A2g = 1
            var _2C5_2_A2g = 1
            var _5C2_A2g = -1
            var i_A2g = 1
            var _2S10_3_A2g = 1
            var _2S10_A2g = 1
            var _5Sigma_d_A2g = -1
            
            //E1g representation
            var E_E1g = 2
            var _2C5_E1g = tau-1
            var _2C5_2_E1g = -tau
            var _5C2_E1g = 0
            var i_E1g = 2
            var _2S10_3_E1g = tau-1
            var _2S10_E1g = -tau
            var _5Sigma_d_E1g = 0
            
            //E2g representation
            var E_E2g = 2
            var _2C5_E2g = -tau
            var _2C5_2_E2g = tau-1
            var _5C2_E2g = 0
            var i_E2g = 2
            var _2S10_3_E2g = -tau
            var _2S10_E2g = tau-1
            var _5Sigma_d_E2g = 0
            
            //A1u representation
            var E_A1u = 1
            var _2C5_A1u = 1
            var _2C5_2_A1u = 1
            var _5C2_A1u = 1
            var i_A1u = -1
            var _2S10_3_A1u = -1
            var _2S10_A1u = -1
            var _5Sigma_d_A1u = -1
            
            //A2u representation
            var E_A2u = 1
            var _2C5_A2u = 1
            var _2C5_2_A2u = 1
            var _5C2_A2u = -1
            var i_A2u = -1
            var _2S10_3_A2u = -1
            var _2S10_A2u = -1
            var _5Sigma_d_A2u = 1
            
            //E1u representation
            var E_E1u = 2
            var _2C5_E1u = tau-1
            var _2C5_2_E1u = -tau
            var _5C2_E1u = 0
            var i_E1u = -2
            var _2S10_3_E1u = -(tau-1)
            var _2S10_E1u = tau
            var _5Sigma_d_E1u = 0
            
            //E2u representation
            var E_E2u = 2
            var _2C5_E2u = -tau
            var _2C5_2_E2u = tau-1
            var _5C2_E2u = 0
            var i_E2u = -2
            var _2S10_3_E2u = tau
            var _2S10_E2u = -(tau-1)
            var _5Sigma_d_E2u = 1
            
            
            //D5d character table in list form
            var A1g = [E_A1g, _2C5_A1g, _2C5_2_A1g, _5C2_A1g, i_A1g, _2S10_3_A1g, _2S10_A1g, _5Sigma_d_A1g]
            var A2g = [E_A2g, _2C5_A2g, _2C5_2_A2g, _5C2_A2g, i_A2g, _2S10_3_A2g, _2S10_A2g, _5Sigma_d_A2g]
            var E1g = [E_E1g, _2C5_E1g, _2C5_2_E1g, _5C2_E1g, i_E1g, _2S10_3_E1g, _2S10_E1g, _5Sigma_d_E1g]
            var E2g = [E_E2g, _2C5_E2g, _2C5_2_E2g, _5C2_E2g, i_E2g, _2S10_3_E2g, _2S10_E2g, _5Sigma_d_E2g]
            var A1u = [E_A1u, _2C5_A1u, _2C5_2_A1u, _5C2_A1u, i_A1u, _2S10_3_A1u, _2S10_A1u, _5Sigma_d_A1u]
            var A2u = [E_A2u, _2C5_A2u, _2C5_2_A2u, _5C2_A2u, i_A2u, _2S10_3_A2u, _2S10_A2u, _5Sigma_d_A2u]
            var E1u = [E_E1u, _2C5_E1u, _2C5_2_E1u, _5C2_E1u, i_E1u, _2S10_3_E1u, _2S10_E1u, _5Sigma_d_E1u]
            var E2u = [E_E2u, _2C5_E2u, _2C5_2_E2u, _5C2_E2u, i_E2u, _2S10_3_E2u, _2S10_E2u, _5Sigma_d_E2u]
            
            
            //order of the group (= number of opperations in the group)
            var h_D5d = 20
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C5 = 2
            var N_C5_2 = 2
            var N_C2 = 5
            var N_i = 1
            var N_S10_3 = 2
            var N_2S10 = 2
            var N_Sigma_d = 5
            
            var N = [N_E, N_C5, N_C5_2, N_C2, N_i, N_S10_3, N_2S10, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1g = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(A1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1g[7]) * Double(N[7]))
            var No_of_A2g = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(A2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2g[7]) * Double(N[7]))
            var No_of_E1g = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(E1g[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E1g[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E1g[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E1g[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E1g[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E1g[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E1g[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E1g[7] as! NSNumber) * Double(N[7]))
            var No_of_E2g = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(E2g[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E2g[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E2g[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E2g[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E2g[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E2g[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E2g[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E2g[7] as! NSNumber) * Double(N[7]))
            var No_of_A1u = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(A1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1u[5]) * Double(N[5])  + Double(Chi_r_7!) * Double(A1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1u[7]) * Double(N[7]))
            var No_of_A2u = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(A2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2u[7]) * Double(N[7]))
            var No_of_E1u = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(E1u[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E1u[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E1u[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E1u[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E1u[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E1u[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E1u[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E1u[7] as! NSNumber) * Double(N[7]))
            var No_of_E2u = (1.0/Double(h_D5d)) * (Double(Chi_r_1!) * Double(E2u[0] as! NSNumber) * Double(N[0]) + Double(Chi_r_2!) * Double(E2u[1] as! NSNumber) * Double(N[1]) + Double(Chi_r_3!) * Double(E2u[2] as! NSNumber) * Double(N[2]) + Double(Chi_r_4!) * Double(E2u[3] as! NSNumber) * Double(N[3]) + Double(Chi_r_5!) * Double(E2u[4] as! NSNumber) * Double(N[4]) + Double(Chi_r_6!) * Double(E2u[5] as! NSNumber) * Double(N[5]) + Double(Chi_r_7!) * Double(E2u[6] as! NSNumber) * Double(N[6]) + Double(Chi_r_8!) * Double(E2u[7] as! NSNumber) * Double(N[7]))
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
            
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2g + No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_E1u + No_of_E2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E1g + No_of_E2g + No_of_A1u + No_of_A2u + No_of_E1u + No_of_E2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            
            while Double(No_of_E1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E2g + No_of_A1u + No_of_A2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1g) + "E₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1g == 1.0{
                    
                    textforLabel += "E₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1g) + "E₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1g == 1.0{
                    
                    textforLabel += "E₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A1u + No_of_A2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2g) + "E₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E2g == 1.0{
                    
                    textforLabel += "E₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2g) + "E₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E2g == 1.0{
                    
                    textforLabel += "E₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2u + No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E1u + No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1u) + "E₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E1u == 1.0{
                    
                    textforLabel += "E₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E1u) + "E₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E1u == 1.0{
                    
                    textforLabel += "E₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E2g) != 0.0{
                
                if No_of_E2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E2u) + "E₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_E2u == 1.0{
                    
                    textforLabel += "E₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1g == 0.0 && No_of_A2g == 0.0 && No_of_E1g == 0.0 && No_of_E2g == 0.0 && No_of_A1u == 0.0 && No_of_A2u == 0.0 && No_of_E1u == 0.0 && No_of_E2u == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1g - floor(No_of_A1g)) > 0.01 || (No_of_A2g - floor(No_of_A2g)) > 0.01 || (No_of_E1g - floor(No_of_E1g)) > 0.01 || (No_of_E2g - floor(No_of_E2g)) > 0.01 || (No_of_A1u - floor(No_of_A1u)) > 0.01 || (No_of_A2u - floor(No_of_A2u)) > 0.01 || (No_of_E1u - floor(No_of_E1u)) > 0.01 || (No_of_E2u - floor(No_of_E2u)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1g) < 0.0 || (No_of_A2g) < 0.0 || (No_of_E1g) < 0.0 || (No_of_E2g) < 0.0 || (No_of_A1u) < 0.0 || (No_of_A2u) < 0.0 || (No_of_E1u) < 0.0 || (No_of_E2u) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_E1g) + "E₁g + " + String(format: "%.1f", No_of_E2g) + "E₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_E1u) + "E₁u + " + String(format: "%.1f", No_of_E2u) + "E₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }

            
        }
        
        else if compoundValue == "Td"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            
            //A1 representation
            var E_A1 = 1
            var _8C3_A1 = 1
            var _3C2_A1 = 1
            var _6S4_A1 = 1
            var _6Sigma_d_A1 = 1
            
            //A2 representation
            var E_A2 = 1
            var _8C3_A2 = 1
            var _3C2_A2 = 1
            var _6S4_A2 = -1
            var _6Sigma_d_A2 = -1
            
            //E representation
            var E_E = 2
            var _8C3_E = -1
            var _3C2_E = 2
            var _6S4_E = 0
            var _6Sigma_d_E = 0
            
            //T1 representation
            var E_T1 = 3
            var _8C3_T1 = 0
            var _3C2_T1 = -1
            var _6S4_T1 = 1
            var _6Sigma_d_T1 = -1
            
            //T2 representation
            var E_T2 = 3
            var _8C3_T2 = 0
            var _3C2_T2 = -1
            var _6S4_T2 = -1
            var _6Sigma_d_T2 = 1
            
            
            //Td character table in list form
            var A1 = [E_A1, _8C3_A1, _3C2_A1, _6S4_A1, _6Sigma_d_A1]
            var A2 = [E_A2, _8C3_A2, _3C2_A2, _6S4_A2, _6Sigma_d_A2]
            var E = [E_E, _8C3_E, _3C2_E, _6S4_E, _6Sigma_d_E]
            var T1 = [E_T1, _8C3_T1, _3C2_T1, _6S4_T1, _6Sigma_d_T1]
            var T2 = [E_T2, _8C3_T2, _3C2_T2, _6S4_T2, _6Sigma_d_T2]
            
            //order of the group (= number of opperations in the group)
            var h_Td = 24
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 8
            var N_C2 = 3
            var N_S4 = 6
            var N_Sigma_d = 6
            
            var N = [N_E, N_C3, N_C2, N_S4, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1 = (1.0/Double(h_Td)) * (Double(Chi_r_1!) * Double(A1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1[4]) * Double(N[4]))
            var No_of_A2 = (1.0/Double(h_Td)) * (Double(Chi_r_1!) * Double(A2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2[4]) * Double(N[4]))
            var No_of_E = (1.0/Double(h_Td)) * (Double(Chi_r_1!) * Double(E[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(E[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(E[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(E[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(E[4]) * Double(N[4]))
            var No_of_T1 = (1.0/Double(h_Td)) * (Double(Chi_r_1!) * Double(T1[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T1[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T1[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T1[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T1[4]) * Double(N[4]))
            var No_of_T2 = (1.0/Double(h_Td)) * (Double(Chi_r_1!) * Double(T2[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T2[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T2[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T2[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T2[4]) * Double(N[4]))
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format: "%.1f", No_of_E) + "E + " + String(format:"%.1f", No_of_T1) + "T₁ + " + String(format:"%.1f", No_of_T2) + "T₂"
            
            var textforLabel = String()
            
            while Double(No_of_A1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2 + No_of_E + No_of_T1 + No_of_T2)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1) + "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1 == 1.0{
                    
                    textforLabel += "A₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_E + No_of_T1 + No_of_T2)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2) + "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2 == 1.0{
                    
                    textforLabel += "A₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_E) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T1 + No_of_T2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_E != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E) + "E + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_E == 1.0{
                    
                    textforLabel += "E + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_E) + "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_E == 1.0{
                    
                    textforLabel += "E"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_T1) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T2)
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1) + "T₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1 == 1.0{
                    
                    textforLabel += "T₁ + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1) + "T₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1 == 1.0{
                    
                    textforLabel += "T₁"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_T1) != 0.0{
                
                if No_of_T1 != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1) + "T₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_T1 == 1.0{
                    
                    textforLabel += "T₂"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1 == 0.0 && No_of_A2 == 0.0 && No_of_E == 0.0 && No_of_T1 == 0.0 && No_of_T2 == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1 - floor(No_of_A1)) > 0.01 || (No_of_A2 - floor(No_of_A2)) > 0.01 || (No_of_E - floor(No_of_E)) > 0.01 || (No_of_T1 - floor(No_of_T1)) > 0.01 || (No_of_T2 - floor(No_of_T2)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format: "%.1f", No_of_E) + "E + " + String(format:"%.1f", No_of_T1) + "T₁ + " + String(format:"%.1f", No_of_T2) + "T₂"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1) < 0.0 || (No_of_A2) < 0.0 || (No_of_E) < 0.0 || (No_of_T1) < 0.0 || (No_of_T2) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1) + "A₁ + " + String(format:"%.1f", No_of_A2) + "A₂ + " + String(format: "%.1f", No_of_E) + "E + " + String(format:"%.1f", No_of_T1) + "T₁ + " + String(format:"%.1f", No_of_T2) + "T₂"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
        }
        
        else if compoundValue == "Oh"{
            
            let Chi_r_1 = imputA.text.toInt()
            let Chi_r_2 = ImputB.text.toInt()
            let Chi_r_3 = imputC.text.toInt()
            let Chi_r_4 = imputD.text.toInt()
            let Chi_r_5 = imputE.text.toInt()
            let Chi_r_6 = imputF.text.toInt()
            let Chi_r_7 = imputG.text.toInt()
            let Chi_r_8 = imputH.text.toInt()
            let Chi_r_9 = imputI.text.toInt()
            let Chi_r_10 = imputJ.text.toInt()
            
            //A1g representation
            var E_A1g = 1
            var _8C3_A1g = 1
            var _6C2_A1g = 1
            var _6C4_A1g = 1
            var _3C2_C4_2_A1g = 1
            var i_A1g = 1
            var _6S4_A1g = 1
            var _8S6_A1g = 1
            var _3Sigma_h_A1g = 1
            var _6Sigma_d_A1g = 1
            
            //A2g representation
            var E_A2g = 1
            var _8C3_A2g = 1
            var _6C2_A2g = -1
            var _6C4_A2g = -1
            var _3C2_C4_2_A2g = 1
            var i_A2g = 1
            var _6S4_A2g = -1
            var _8S6_A2g = 1
            var _3Sigma_h_A2g = 1
            var _6Sigma_d_A2g = -1
            
            //Eg representation
            var E_Eg = 2
            var _8C3_Eg = -1
            var _6C2_Eg = 0
            var _6C4_Eg = 0
            var _3C2_C4_2_Eg = 2
            var i_Eg = 2
            var _6S4_Eg = 0
            var _8S6_Eg = -1
            var _3Sigma_h_Eg = 2
            var _6Sigma_d_Eg = 0
            
            //T1g representation
            var E_T1g = 3
            var _8C3_T1g = 0
            var _6C2_T1g = -1
            var _6C4_T1g = 1
            var _3C2_C4_2_T1g = -1
            var i_T1g = 3
            var _6S4_T1g = 1
            var _8S6_T1g = 0
            var _3Sigma_h_T1g = -1
            var _6Sigma_d_T1g = -1
            
            //T2g representation
            var E_T2g = 3
            var _8C3_T2g = 0
            var _6C2_T2g = 1
            var _6C4_T2g = -1
            var _3C2_C4_2_T2g = -1
            var i_T2g = 3
            var _6S4_T2g = -1
            var _8S6_T2g = 0
            var _3Sigma_h_T2g = -1
            var _6Sigma_d_T2g = 1
            
            //A1u representation
            var E_A1u = 1
            var _8C3_A1u = 1
            var _6C2_A1u = 1
            var _6C4_A1u = 1
            var _3C2_C4_2_A1u = 1
            var i_A1u = -1
            var _6S4_A1u = -1
            var _8S6_A1u = -1
            var _3Sigma_h_A1u = -1
            var _6Sigma_d_A1u = -1
            
            //A2u representation
            var E_A2u = 1
            var _8C3_A2u = 1
            var _6C2_A2u = -1
            var _6C4_A2u = -1
            var _3C2_C4_2_A2u = 1
            var i_A2u = -1
            var _6S4_A2u = 1
            var _8S6_A2u = -1
            var _3Sigma_h_A2u = -1
            var _6Sigma_d_A2u = 1
            
            //Eu representation
            var E_Eu = 2
            var _8C3_Eu = -1
            var _6C2_Eu = 0
            var _6C4_Eu = 0
            var _3C2_C4_2_Eu = 2
            var i_Eu = -2
            var _6S4_Eu = 0
            var _8S6_Eu = 1
            var _3Sigma_h_Eu = -2
            var _6Sigma_d_Eu = 0
            
            //T1u representation
            var E_T1u = 3
            var _8C3_T1u = 0
            var _6C2_T1u = -1
            var _6C4_T1u = 1
            var _3C2_C4_2_T1u = -1
            var i_T1u = -3
            var _6S4_T1u = -1
            var _8S6_T1u = 0
            var _3Sigma_h_T1u = 1
            var _6Sigma_d_T1u = 1
            
            //T2u representation
            var E_T2u = 3
            var _8C3_T2u = 0
            var _6C2_T2u = 1
            var _6C4_T2u = -1
            var _3C2_C4_2_T2u = -1
            var i_T2u = -3
            var _6S4_T2u = 1
            var _8S6_T2u = 0
            var _3Sigma_h_T2u = 1
            var _6Sigma_d_T2u = -1
            
            //Oh character table in list form
            var A1g = [E_A1g, _8C3_A1g, _6C2_A1g, _6C4_A1g, _3C2_C4_2_A1g, i_A1g, _6S4_A1g, _8S6_A1g, _3Sigma_h_A1g, _6Sigma_d_A1g]
            var A2g = [E_A2g, _8C3_A2g, _6C2_A2g, _6C4_A2g, _3C2_C4_2_A2g, i_A2g, _6S4_A2g, _8S6_A2g, _3Sigma_h_A2g, _6Sigma_d_A2g]
            var Eg = [E_Eg, _8C3_Eg, _6C2_Eg, _6C4_Eg, _3C2_C4_2_Eg, i_Eg, _6S4_Eg, _8S6_Eg, _3Sigma_h_Eg, _6Sigma_d_Eg]
            var T1g = [E_T1g, _8C3_T1g, _6C2_T1g, _6C4_T1g, _3C2_C4_2_T1g, i_T1g, _6S4_T1g, _8S6_T1g, _3Sigma_h_T1g, _6Sigma_d_T1g]
            var T2g = [E_T2g, _8C3_T2g, _6C2_T2g, _6C4_T2g, _3C2_C4_2_T2g, i_T2g, _6S4_T2g, _8S6_T2g, _3Sigma_h_T2g, _6Sigma_d_T2g]
            var A1u = [E_A1u, _8C3_A1u, _6C2_A1u, _6C4_A1u, _3C2_C4_2_A1u, i_A1u, _6S4_A1u, _8S6_A1u, _3Sigma_h_A1u, _6Sigma_d_A1u]
            var A2u = [E_A2u, _8C3_A2u, _6C2_A2u, _6C4_A2u, _3C2_C4_2_A2u, i_A2u, _6S4_A2u, _8S6_A2u, _3Sigma_h_A2u, _6Sigma_d_A2u]
            var Eu = [E_Eu, _8C3_Eu, _6C2_Eu, _6C4_Eu, _3C2_C4_2_Eu, i_Eu, _6S4_Eu, _8S6_Eu, _3Sigma_h_Eu, _6Sigma_d_Eu]
            var T1u = [E_T1u, _8C3_T1u, _6C2_T1u, _6C4_T1u, _3C2_C4_2_T1u, i_T1u, _6S4_T1u, _8S6_T1u, _3Sigma_h_T1u, _6Sigma_d_T1u]
            var T2u = [E_T2u, _8C3_T2u, _6C2_T2u, _6C4_T2u, _3C2_C4_2_T2u, i_T2u, _6S4_T2u, _8S6_T2u, _3Sigma_h_T2u, _6Sigma_d_T2u]
            
            
            //order of the group (= number of opperations in the group)
            var h_Oh = 48
            
            //number of symmetry opperations in the class
            var N_E = 1
            var N_C3 = 8
            var N_C2 = 6
            var N_C4 = 6
            var N_C2_C4_2 = 3
            var N_i = 1
            var N_S4 = 6
            var N_S8 = 8
            var N_Sigma_h = 3
            var N_Sigma_d = 6
            
            var N = [N_E, N_C3, N_C2, N_C4, N_C2_C4_2, N_i, N_S4, N_S8, N_Sigma_h, N_Sigma_d]
            
            //compute using reduction formula
            var No_of_A1g = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(A1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1g[9]) * Double(N[9]))
            var No_of_A2g = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(A2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2g[9]) * Double(N[9]))
            var No_of_Eg = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(Eg[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eg[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eg[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eg[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eg[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eg[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Eg[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Eg[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(Eg[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(Eg[9]) * Double(N[9]))
            var No_of_T1g = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(T1g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T1g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T1g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T1g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T1g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(T1g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(T1g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(T1g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(T1g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(T1g[9]) * Double(N[9]))
            var No_of_T2g = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(T2g[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T2g[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T2g[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T2g[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T2g[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(T2g[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(T2g[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(T2g[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(T2g[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(T2g[9]) * Double(N[9]))
            var No_of_A1u = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(A1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A1u[9]) * Double(N[9]))
            var No_of_A2u = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(A2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(A2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(A2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(A2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(A2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(A2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(A2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(A2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(A2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(A2u[9]) * Double(N[9]))
            var No_of_Eu = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(Eu[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(Eu[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(Eu[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(Eu[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(Eu[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(Eu[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(Eu[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(Eu[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(Eu[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(Eu[9]) * Double(N[9]))
            var No_of_T1u = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(T1u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T1u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T1u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T1u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T1u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(T1u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(T1u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(T1u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(T1u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(T1u[9]) * Double(N[9]))
            var No_of_T2u = (1.0/Double(h_Oh)) * (Double(Chi_r_1!) * Double(T2u[0]) * Double(N[0]) + Double(Chi_r_2!) * Double(T2u[1]) * Double(N[1]) + Double(Chi_r_3!) * Double(T2u[2]) * Double(N[2]) + Double(Chi_r_4!) * Double(T2u[3]) * Double(N[3]) + Double(Chi_r_5!) * Double(T2u[4]) * Double(N[4]) + Double(Chi_r_6!) * Double(T2u[5]) * Double(N[5]) + Double(Chi_r_7!) * Double(T2u[6]) * Double(N[6]) + Double(Chi_r_8!) * Double(T2u[7]) * Double(N[7]) + Double(Chi_r_9!) * Double(T2u[8]) * Double(N[8]) + Double(Chi_r_10!) * Double(T2u[9]) * Double(N[9]))
            
            
            
            mockLabel.text = String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format: "%.1f", No_of_Eg) + "Eg + " + String(format:"%.1f", No_of_T1g) + "T₁g + " + String(format:"%.1f", No_of_T2g) + "T₂g " + "+ " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format: "%.1f", No_of_Eu) + "Eu + " + String(format:"%.1f", No_of_T1u) + "T₁u + " + String(format:"%.1f", No_of_T2u) + "T₂u"
            
            
            mockLabel.adjustsFontSizeToFitWidth = true
            
            var textforLabel = String()
            
            while Double(No_of_A1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2g + No_of_Eg + No_of_T1g + No_of_T2g + No_of_A1u + No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1g) + "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1g == 1.0{
                    
                    textforLabel += "A₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eg + No_of_T1g + No_of_T2g + No_of_A1u + No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2g) + "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2g == 1.0{
                    
                    textforLabel += "A₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eg) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T1g + No_of_T2g + No_of_A1u + No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if  remaingrepresentaionvalues > 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eg) + "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eg == 1.0{
                    
                    textforLabel += "Eg"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                
                break
                
            }
            
            
            while Double(No_of_T1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T2g + No_of_A1u + No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1g) + "T₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1g == 1.0{
                    
                    textforLabel += "T₁g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1g) + "T₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1g == 1.0{
                    
                    textforLabel += "T₁g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_T2g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A1u + No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_T2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T2g) + "T₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_T2g == 1.0{
                    
                    textforLabel += "T₂g + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T2g != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T2g) + "T₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T2g == 1.0{
                    
                    textforLabel += "T₂g"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A1u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_A2u + No_of_Eu + No_of_T1u + No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A1u) + "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A1u == 1.0{
                    
                    textforLabel += "A₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_A2u) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_Eu + No_of_T1u + No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_A2u) + "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_A2u == 1.0{
                    
                    textforLabel += "A₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_Eu) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T1u + No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eu != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eu) + "Eu + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_Eu == 1.0{
                    
                    textforLabel += "Eu + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eu != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_Eu) + "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_Eu == 1.0{
                    
                    textforLabel += "Eu"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_T1g) != 0.0{
                
                var remaingrepresentaionvalues = (No_of_T2u)
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1u) + "T₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues > 0.0 && No_of_T1u == 1.0{
                    
                    textforLabel += "T₁u + "
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T1u) + "T₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if remaingrepresentaionvalues == 0.0 && No_of_T1u == 1.0{
                    
                    textforLabel += "T₁u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while Double(No_of_T2u) != 0.0{
                
                if No_of_T2u != 1.0{
                    
                    textforLabel += String(format:"%.0f", No_of_T2u) + "T₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                if No_of_T2u == 1.0{
                    
                    textforLabel += "T₂u"
                    
                    mockLabel.text = textforLabel
                    
                    mockLabel.textColor = UIColor.blackColor()
                }
                
                break
                
            }
            
            while No_of_A1g == 0.0 && No_of_A2g == 0.0 && No_of_Eg == 0.0 && No_of_T1g == 0.0 && No_of_T2g == 0.0 && No_of_A1u == 0.0 && No_of_A2u == 0.0 && No_of_Eu == 0.0 && No_of_T1u == 0.0 && No_of_T2u == 0.0{
                
                mockLabel.text = "0"
                
                mockLabel.textColor = UIColor.redColor()
                
                break
            }
            
            
            while (No_of_A1g - floor(No_of_A1g)) > 0.01 || (No_of_A2g - floor(No_of_A2g)) > 0.01 || (No_of_Eg - floor(No_of_Eg)) > 0.01 || (No_of_T1g - floor(No_of_T1g)) > 0.01 || (No_of_T2g - floor(No_of_T2g)) > 0.01 || (No_of_A1u - floor(No_of_A1u)) > 0.01 || (No_of_A2u - floor(No_of_A2u)) > 0.01 || (No_of_Eu - floor(No_of_Eu)) > 0.01 || (No_of_T1u - floor(No_of_T1u)) > 0.01 || (No_of_T2u - floor(No_of_T2u)) > 0.01{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_Eg) + "Eg + " + String(format: "%.1f", No_of_T1g) + "T₁g + " + String(format: "%.1f", No_of_T2g) + "T₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_Eu) + "Eu + " + String(format: "%.1f", No_of_T1u) + "T₁u + " + String(format: "%.1f", No_of_T2u) + "T₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
            
            while (No_of_A1g) < 0.0 || (No_of_A2g) < 0.0 || (No_of_Eg) < 0.0 || (No_of_T1g) < 0.0 || (No_of_T2g) < 0.0 || (No_of_A1u) < 0.0 || (No_of_A2u) < 0.0 || (No_of_Eu) < 0.0 || (No_of_T1u) < 0.0 || (No_of_T2u) < 0.0{
                
                
                mockLabel.text = "Invaild Representation: " + String(format:"%.1f", No_of_A1g) + "A₁g + " + String(format:"%.1f", No_of_A2g) + "A₂g + " + String(format:"%.1f", No_of_Eg) + "Eg + " + String(format: "%.1f", No_of_T1g) + "T₁g + " + String(format: "%.1f", No_of_T2g) + "T₂g + " + String(format:"%.1f", No_of_A1u) + "A₁u + " + String(format:"%.1f", No_of_A2u) + "A₂u + " + String(format:"%.1f", No_of_Eu) + "Eu + " + String(format: "%.1f", No_of_T1u) + "T₁u + " + String(format: "%.1f", No_of_T2u) + "T₂u"
                
                
                mockLabel.textColor = UIColor.redColor()
                
                
                mockLabel.adjustsFontSizeToFitWidth = true
                
                
                break
                
            }
            
        }

    
    }
    
    
    @IBOutlet var oveallview: UIView!
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
   // override func viewDidLoad() {
        //super.viewDidLoad()
       // selctionButtonView.enabled = false
        //MainGroupSelector.dataSource = self
        //MainGroupSelector.delegate = self
       // imputA.delegate = self
       // ImputB.delegate = self
       // imputC.delegate = self
       // imputD.delegate = self
       // imputE.delegate = self
       // imputF.delegate = self
       // imputG.delegate = self
       // imputH.delegate = self
       // imputI.delegate = self
       // imputJ.delegate = self
       // imputK.delegate = self
       // imputL.delegate = self
       // M.delegate = self
       // imputA.keyboardType = .NumberPad
       // ImputB.keyboardType = .NumberPad
       // imputC.keyboardType = .NumberPad
       // imputD.keyboardType = .NumberPad
       // imputE.keyboardType = .NumberPad
        //imputF.keyboardType = .NumberPad
        //imputG.keyboardType = .NumberPad
       // imputH.keyboardType = .NumberPad
        //imputI.keyboardType = .NumberPad
        //imputJ.keyboardType = .NumberPad
        //imputK.keyboardType = .NumberPad
        //imputL.keyboardType = .NumberPad
        //M.keyboardType = .NumberPad
    
//}

    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
       // self.scrollView.setContentOffset(CGPointMake(0, field_extra.center.y-280), animated: true)
        //callanimation()
        //self .viewDidLayoutSubviews()
        
        animateViewMoving(true, moveValue: 160)

    
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        //self.scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        //self .viewDidLayoutSubviews()
        
        animateViewMoving(false, moveValue: 160)
        
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //func keyboardWasShown(notification: NSNotification) {
       // var info = notification.userInfo!
       // var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
       // UIView.animateWithDuration(0.1, animations: { () -> Void in
           // self.Constrainttwo.constant = keyboardFrame.size.height + 20
       // })
   // }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if var intVal = text.toInt() {
            // Text field converted to an Int
            selctionButtonView.enabled = true
        }
            
        
        else {
            // Text field is not an Int
            selctionButtonView.enabled = false
        }
        
        var length = (count(textField.text) + count(string))
        if length > 6{
            return false
        }
        else{
            return true
        }
    }
}
