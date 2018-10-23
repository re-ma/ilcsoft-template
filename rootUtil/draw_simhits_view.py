import ROOT as rt
import sys
import math

### Draw sim hits

# Lamuda function for radius
radiusCal = lambda x,y: math.sqrt(x*x + y*y)


# lambda function fo subdet id
subCal = lambda x: cellid & 0x0000001f

if __name__ == "__main__":
    rootFile = rt.TFile(sys.argv[1])
    rootFile.ls()
    rootTree = rootFile.Get("MyLCTuple")
    #rootTree.Scan()
    #rootTree.Show(1)
    c1 = rt.TCanvas("C1","Some example plots from LCTuple",1000 , 1000)
    c1.Divide(2,2)
    c1.cd(1)

    radiusrzhsc = rt.TH2F("rz1","rz view",10000,-5000,5000,10000,-5000,5000)
    radiusrzhst = rt.TH2F("rz2","rz2",10000,-5000,5000,10000,-5000,5000)
    radiusxzhsc = rt.TH2F("xz1","xz view",10000,-5000,5000,10000,-5000,5000)
    radiusxzhst = rt.TH2F("xz2","xz2",10000,-5000,5000,10000,-5000,5000)
    radiusyzhsc = rt.TH2F("yz1","yz view",10000,-5000,5000,10000,-5000,5000)
    radiusyzhst = rt.TH2F("yz2","yz2",10000,-5000,5000,10000,-5000,5000)
    radiusxyhsc = rt.TH2F("xy1","xy view",10000,-5000,5000,10000,-5000,5000)
    radiusxyhst = rt.TH2F("xy2","xy2",10000,-5000,5000,10000,-5000,5000)

    for i in range(0,rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<5000.:
                radiusrzhsc.Fill(rootTree.scpoz[j],radiusCal(rootTree.scpox[j],rootTree.scpoy[j]))
                radiusxzhsc.Fill(rootTree.scpoz[j],rootTree.scpox[j])
                radiusyzhsc.Fill(rootTree.scpoz[j],rootTree.scpoy[j])
        for k in range(0,len(rootTree.stpox)):
            if radiusCal(rootTree.stpox[k],rootTree.stpoy[k])<5500. and abs(rootTree.stpoz[k])<5000.:
                radiusrzhsc.Fill(rootTree.stpoz[k],radiusCal(rootTree.stpox[k],rootTree.stpoy[k]))
                radiusxzhsc.Fill(rootTree.stpoz[k],rootTree.stpox[k])
                radiusyzhsc.Fill(rootTree.stpoz[k],rootTree.stpoy[k])

    radiusrzhsc.Draw()
    radiusrzhst.Draw("SAME")
    c1.Update()

    c1.cd(3)
    radiusxzhsc.Draw()
    radiusxzhst.Draw("SAME")
    c1.Update()

    c1.cd(4)
    radiusyzhsc.Draw()
    radiusyzhst.Draw("SAME")
    c1.Update()

    c1.cd(2)

    for i in range(0,rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<2400.:
                radiusxyhsc.Fill(rootTree.scpox[j],rootTree.scpoy[j])
        for k in range(0,len(rootTree.stpox)):
            if radiusCal(rootTree.stpox[k],rootTree.stpoy[k])<5500. and abs(rootTree.stpoz[k])<2400.:
                radiusxyhst.Fill(rootTree.stpox[k],rootTree.stpoy[k])
    radiusxyhsc.Draw()
    radiusxyhst.Draw("SAME")
    c1.Update()
    #rootTree.Draw("scpox:scpoy","radiusCal(scpox,scpoy)<5500&abs(scpoz)<2400.","",maxCount)
    #rootTree.Draw("stpox:stpoy","radiusCal(stpox,stpoy)<5500.&abs(stpoz)<2400.&&(stci0&0x001f)!=3","same",maxCount)

