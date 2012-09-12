package digicrafts.extensions;

import com.adobe.fre.*;

public class MopubCreateFunction implements FREFunction {
	
	@Override
  	public FREObject call(FREContext context, FREObject[] args)
	{
		FREObject unitIdObj = args[0];
	    try
	    {
	    		String unitId = unitIdObj.getAsString();
			MopubExtensionContext cnt = (MopubExtensionContext)context;
			cnt.createAd(context.getActivity());
			cnt.saveUnitId(unitId);
			cnt.getAdView().setAdUnitId(unitId);
			cnt.getAdView().loadAd();
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
