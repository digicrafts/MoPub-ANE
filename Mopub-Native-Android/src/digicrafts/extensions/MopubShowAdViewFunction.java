package digicrafts.extensions;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.widget.RelativeLayout;


import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.mopub.mobileads.MoPubView;

public class MopubShowAdViewFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args)
	  {
	    try
	    {
	      FREObject param = args[0];
	      int x = param.getAsInt();
	      param = args[1];
	      int y = param.getAsInt();
	      param = args[2];
	      int w = param.getAsInt();
	      param = args[3];
	      int h = param.getAsInt();
	      MopubExtensionContext cnt = (MopubExtensionContext)context;
	      cnt.setBannerRect(new Rect(x, y, x + w, y + h));

	      MoPubView adView = cnt.getAdView();
	      Activity act = context.getActivity();

	      RelativeLayout rl = cnt.getAdHolder();
	      if (rl == null)
	      {
	        rl = ANEUtils.addView(act, adView, cnt.getBannerRect());
	        cnt.setAdHolder(rl);
	      }
	      else
	      {
	        ANEUtils.positionAndResizeView(adView, cnt.getBannerRect());
	      }
	      
	      adView.setVisibility(View.VISIBLE);
	    	
//	      adView.setAdUnitId(cnt.getUnitId());
//	      adView.loadAd();
	    }
	    catch (IllegalStateException e) {
	      e.printStackTrace();
	    } catch (FRETypeMismatchException e) {
	      e.printStackTrace();
	    } catch (FREInvalidObjectException e) {
	      e.printStackTrace();
	    } catch (FREWrongThreadException e) {
	      e.printStackTrace();
	    }

	    return null;
	  }

}
