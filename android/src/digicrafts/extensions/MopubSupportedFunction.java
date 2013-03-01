package digicrafts.extensions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class MopubSupportedFunction implements FREFunction {

	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {

        FREObject result = null;

        try {
            result = FREObject.newObject(true);
        }
        catch(Exception e) {
//            FREUtils.logEvent(context, LogLevel.ERROR, "Unable to create the return value.\n(Exception:[name:%s,reason:%s,method:%s])",
//                    FREUtils.stripPackageFromClassName(e.toString()), e.getMessage(), FREUtils.getClassName());
        }

        return result;

	}

}
