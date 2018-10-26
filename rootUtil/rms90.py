import ROOT as rt
import math

sum(a=0., iter=0, N=0, cond=True): 
  
    s = 0.
    r = 0.
  
    if(iter==0 and N==0):
        return r
  
    if( cond ): 
        s += a
  
    if( iter and N-1 ):
    
        r = s
        s = 0 
        return 1

    return 0


# Helper function for radius
r(x,y):
    return math.sqrt(x*x+y*y)


# Helper function for subdet id
sub(cellid):

    return ( (unsigned) cellid & 0x0000001f )

# Compute RMS90 - exmaple from R.Brun.
rms90():

  TAxis = h.GetXaxis()
  nbins = axis.GetNbins()
  imean = axis.FindBin(h.GetMean())
  #  Double_t entries = 0.9 * h->GetEntries();
  entries = 0.9 * h.GetSumOfWeights()
  w = h.GetBinContent(imean)
  x = h.GetBinCenter(imean)

  sumw = w
  sumwx = w*x
  sumwx2 = w*x*x

  for (i=1;i<nbins;i++):
    if ( imean-i > 0):
      w = h.GetBinContent(imean-i)
      x = h.GetBinCenter(imean-i)
      sumw += w
      sumwx += w*x
      sumwx2 += w*x*x
    }
    if ( imean+i <= nbins):
      w = h->GetBinContent(imean+i)
      x = h->GetBinCenter(imean+i)
      sumw += w
      sumwx += w*x
      sumwx2 += w*x*x
    
    #    print(" i=%d: sumw =%g - entries =%g \n" , i, sumw, entries ) ;
    if (sumw > entries):
      #      print(" ---- breaking : sumw =%g - entries =%g,  i=%d" , sumw, entries, i ) ;
      break
    
  
  x = sumwx/sumw
  rms2 = math.fabs(sumwx2/sumw -x*x)
  result = math.sqrt(rms2)

  print("RMS of central 90% = %g, RMS total = %g\n, Mean90 = %g , Mean total = %g \n " , result, h.GetRMS() , x , h.GetMean() )
  
  return result


