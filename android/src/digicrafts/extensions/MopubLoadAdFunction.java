package digicrafts.extensions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class MopubLoadAdFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		MopubExtensionContext cnt = (MopubExtensionContext)context;
		cnt.loadAd();
		
		return null;
	}

}
