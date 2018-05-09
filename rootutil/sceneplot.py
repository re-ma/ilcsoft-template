import ROOT as rt

filePass = "data/ddMarlin_Sc_REC_lctuple.root"

rootFile = rt.TFile(filePass)

rCanvas = rt.TCanvas("cv", "Ecal Sc Deposit Energy", 2000, 2000)

treeFile = rootFile.Get("MyLCTuple")

h1 = rt.TH1F("h1","Ecal Sc Deposit Energy;GeV;Count;",1000,0,0.002)

treeFile.Draw("scene>>h1")
#h1.Draw()
rCanvas.SetLogy(1)

rCanvas.Draw()


