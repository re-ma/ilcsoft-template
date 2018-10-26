import ROOT as rt
import sys

#filePass = "data/ddMarlin_Sc_REC_lctuple.root"

rootFile = rt.TFile(sys.argv[1])

rCanvas = rt.TCanvas("cv", sys.argv[2], 2000, 2000)

treeFile = rootFile.Get("PfoAnalysisTree")

h1 = rt.TH1F("h1","Reconstruction Energy (pfoEnergyTotal);GeV;Count;",500,0,20)

treeFile.Draw("pfoEnergyTotal>>h1")
#h1.Draw()
#rCanvas.SetLogy(1)

rCanvas.Draw()


rCanvas2 = rt.TCanvas("cv2", sys.argv[2], 2000, 2000)
h2 = rt.TH1F("h2","Reconstruction Energy (pfoEnergyPhotons);GeV;Count;",500,0,20)
treeFile.Draw("pfoEnergyPhotons>>h2")
rCanvas2.Draw()
