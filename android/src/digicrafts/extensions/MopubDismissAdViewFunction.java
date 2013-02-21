package digicrafts.extensions;

import android.view.View;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.mopub.mobileads.MoPubView;

public class MopubDismissAdViewFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		MopubExtensionContext cnt = (MopubExtensionContext)context;

		MoPubView adView = cnt.getAdView();

		adView.setAutorefreshEnabled(false);
		adView.setVisibility(View.INVISIBLE);
		
		return null;
	}

}
