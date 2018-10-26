import ROOT as rt
import sys

filePass = "data/ddMarlin_Sc_REC_lctuple.root"

rootFile = rt.TFile(sys.argv[1])

rCanvas = rt.TCanvas("cv", sys.argv[2], 2000, 2000)

treeFile = rootFile.Get("MyLCTuple")

h1 = rt.TH1F("h1","Reconstruction Energy (rcene);GeV;Count;",500,0,20)

treeFile.Draw("rcene>>h1")
#h1.Draw()
#rCanvas.SetLogy(1)

rCanvas.Draw()


