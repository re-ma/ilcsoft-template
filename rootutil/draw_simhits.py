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
    c1.Divide(1,2)
    c1.cd(1)

    radiusrzh1 = rt.TH2F("rz1","rz1",10000,-5000,5000,5000,0,5000)
    radiusrzh2 = rt.TH2F("rz2","rz2",10000,-5000,5000,5000,0,5000)
    radiusxyh1 = rt.TH2F("xy1","xy1",20000,-10000,10000,10000,-5000,5000)
    radiusxyh2 = rt.TH2F("xy2","xy2",20000,-10000,10000,10000,-5000,5000)

    for i in range(0,rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<5000.:
                radiusrzh1.Fill(rootTree.scpoz[j],radiusCal(rootTree.scpox[j],rootTree.scpoy[j]))
        for k in range(0,len(rootTree.stpox)):
            if radiusCal(rootTree.stpox[k],rootTree.stpoy[k])<5500. and abs(rootTree.stpoz[k])<5000.:
                radiusrzh2.Fill(rootTree.stpoz[k],radiusCal(rootTree.stpox[k],rootTree.stpoy[k]))

    radiusrzh1.Draw()
    radiusrzh2.Draw("SAME")
    c1.Update()
    #rootTree.Draw("radiusCal(scpox,scpoy):scpoz","radiusCal(scpox,scpoy)<5500.&abs(scpoz)<5000.","",maxCount)
    #rootTree.Draw("radiusCal(stpox,stpoy):stpoz","radiusCal(stpox,stpoy)<5500.&abs(stpoz)<5000.","same",maxCount)

    c1.cd(2)

    for i in range(0,rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<2400.:
                radiusxyh1.Fill(rootTree.scpox[j],rootTree.scpoy[j])
        for k in range(0,len(rootTree.stpox)):
            if radiusCal(rootTree.stpox[k],rootTree.stpoy[k])<5500. and abs(rootTree.stpoz[k])<2400.:
                radiusxyh2.Fill(rootTree.stpox[k],rootTree.stpoy[k])
    radiusxyh1.Draw()
    radiusxyh2.Draw("SAME")
    c1.Update()
    #rootTree.Draw("scpox:scpoy","radiusCal(scpox,scpoy)<5500&abs(scpoz)<2400.","",maxCount)
    #rootTree.Draw("stpox:stpoy","radiusCal(stpox,stpoy)<5500.&abs(stpoz)<2400.&&(stci0&0x001f)!=3","same",maxCount)

