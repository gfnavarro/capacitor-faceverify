package com.excle.ionicfvo;

import static androidx.core.content.ContextCompat.startActivity;

import com.getcapacitor.BridgeActivity;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.ActivityCallback;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.annotation.Permission;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;

import org.chromium.base.Callback;

@CapacitorPlugin(name = "FaceVerify",
permissions = {
    @Permission(alias = "camera", strings = { Manifest.permission.CAMERA }),
  })
public class FaceVerifyPlugin extends Plugin  {

    private ActivityResultLauncher<Intent> activityResultLauncher;

    @PluginMethod
    public void showVerify(PluginCall call) {
        String url = call.getString("url");

        Intent intent = new Intent(getContext(), WebViewActivity.class);
        intent.putExtra("url", url);
        startActivityForResult(call, intent, "onResult");

    }

    @ActivityCallback
    private void onResult(PluginCall call, ActivityResult result) {
        if (call == null) {
            return;
        }
        JSObject ret = new JSObject();
        var resCode = result.getResultCode();
        if (resCode == Activity.RESULT_OK)
        {
            ret.put("result", true);
        }
        else{
            ret.put("result", false);
        }
        call.resolve(ret);
    }


}
