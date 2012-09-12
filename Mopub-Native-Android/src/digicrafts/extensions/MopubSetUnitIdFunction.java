package digicrafts.extensions;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class MopubSetUnitIdFunction implements FREFunction {

	
	  private static final String TAG = MopubSetUnitIdFunction.class.getName();
	  
	  @Override
	  public FREObject call(FREContext context, FREObject[] args)
	  {
	    Log.d(TAG, "MopubSetUnitID called.");
	    FREObject unitIdObj = args[0];
	    try
	    {
	      String unitId = unitIdObj.getAsString();
	      MopubExtensionContext cnt = (MopubExtensionContext)context;
	      cnt.saveUnitId(unitId);
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
