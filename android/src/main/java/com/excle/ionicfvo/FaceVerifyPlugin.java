package com.excle.ionicfvo;

import static androidx.core.content.ContextCompat.startActivity;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

@CapacitorPlugin(name = "FaceVerify")
public class FaceVerifyPlugin extends Plugin {

    @PluginMethod
    public void showVerify(PluginCall call) {
        String url = call.getString("url");

        Intent intent = new Intent(getActivity(), FullscreenWebViewActivity.class);
        intent.putExtra(FullscreenWebViewActivity.URL_EXTRA, url);
        startActivity(getContext(), intent, Bundle.EMPTY);

        JSObject ret = new JSObject();
        ret.put("result", true);
        call.resolve(ret);
    }
}
