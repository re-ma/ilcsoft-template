import ROOT as rt
import sys
import math

### Draw sim hits

if __name__ == "__main__":
    rootFile = rt.TFile(sys.argv[1])
    rootTree = rootFile.Get("MyLCTuple")


    h0 = rt.TH1F("h0","total energy [GeV] from MCParticle",100,0,20)
    h1 = rt.TH1F("h1","total energy [GeV] from PFOs",100,0,20)

#    TH1F* h0 = new TH1F("h0","total energy [GeV] from MCParticle",120.,60.,120.)
#    TH1F* h = new TH1F("h","total energy [GeV] from PFOs",120.,60.,120.)

    c1 = rt.TCanvas("C1","Total energy - McTruth vs. PFOs",800,800)
    c1.Divide(1,2)
  
    c1.cd(1)

    for i in range(0,rootTree.GetEntries()):
        rootTree.GetEntry(i)
        mceneSum = 0
        for j in range(0,len(rootTree.mcgst)):
            if rootTree.mcgst[j] == 1:
                mceneSum += rootTree.mcene[j]
        print mceneSum
        print sum(rootTree.rcene)
	h0.Fill(mceneSum)
	h1.Fill(sum(rootTree.rcene))

    h0.Draw()
    c1.Update()

    c1.cd(2)

    h1.Draw()
    c1.Update()


ignore = '''
### Draw sim hits

# Lamuda function for radius
radiusCal = lambda x,y: math.sqrt(x*x + y*y)


# lambda function fo subdet id
subCal = lambda x: cellid & 0x0000001f

if __name__ == "__main__":
    rootFile = rt.TFile(sys.argv[1])
    rootFile.ls()
    rootTree = rootFile.Get("MyLCTuple")
    rootTree.Scan()
    rootTree.Show(1)
    c1 = rt.TCanvas("C1","Some example plots from LCTuple",1000 , 1000)
    c1.Divide(1,2)
    c1.cd(1)

    radiush1 = rt.TH2F("h1","h1",10000,-5000,5000,5000,0,5000)
    radiush2 = rt.TH2F("h2","h2",20000,-10000,10000,10000,-5000,5000)

    for i in range(0,3):#rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<5000.:
                radiush1.Fill(rootTree.scpoz[j],radiusCal(rootTree.scpox[j],rootTree.scpoy[j]))

            radiush1.Draw()
	
    print j
    radiush1.Draw()
    c1.Update()
    #rootTree.Draw("radiusCal(scpox,scpoy):scpoz","radiusCal(scpox,scpoy)<5500.&abs(scpoz)<5000.","",maxCount)
    #rootTree.Draw("radiusCal(stpox,stpoy):stpoz","radiusCal(stpox,stpoy)<5500.&abs(stpoz)<5000.","same",maxCount)

    c1.cd(2)

    for i in range(0,3):#rootTree.GetEntries()):
        rootTree.GetEntry(i)
        for j in range(0,len(rootTree.scpox)):
            #print rootTree.scpox[j]
            #print rootTree.scpoy[1]
            #print rootTree.scpoz[1]
            if radiusCal(rootTree.scpox[j],rootTree.scpoy[j])<5500. and abs(rootTree.scpoz[j])<2400.:
                radiush2.Fill(rootTree.scpox[j],rootTree.scpoy[j])
    radiush2.Draw()
    c1.Update()
    #rootTree.Draw("scpox:scpoy","radiusCal(scpox,scpoy)<5500&abs(scpoz)<2400.","",maxCount)
    #rootTree.Draw("stpox:stpoy","radiusCal(stpox,stpoy)<5500.&abs(stpoz)<2400.&&(stci0&0x001f)!=3","same",maxCount)
'''
ignore = '''
#include "funs.C"

void draw_etot( const char* FILEN , const char* TupleName="LCTuple") {


  std::string pdfFile( std::string( FILEN ) + std::string( "_etot.pdf" ) ) ;

  TFile* f = new TFile(FILEN) ;

  TTree* tree = (TTree*) f->Get( TupleName ) ;

  TH1F* h0 = new TH1F("h0","total energy [GeV] from MCParticle",120.,60.,120.) ;
  TH1F* h = new TH1F("h","total energy [GeV] from PFOs",120.,60.,120.) ;

  c1 = new TCanvas("C1","Total energy - McTruth vs. PFOs",-5);
  c1->Divide(1,2);
  
  c1->cd(1) ;

  MyLCTuple->Draw("sum()","sum( mcene, Iteration$, nmcp,(mcgst==1) )" ) ;       

  c1->cd(2) ;

  MyLCTuple->Draw("sum()","sum( rcene, Iteration$, nrec, 1)" ) ;       

  //c1->Print( pdfFile.c_str() ) ;

}

'''
