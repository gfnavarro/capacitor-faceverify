package com.excle.ionicfvo;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.appcompat.app.AppCompatActivity;

public class FullscreenWebViewActivity extends AppCompatActivity {

    private WebView webView;

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Configura el WebView
        webView = new WebView(this);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebChromeClient(new WebChromeClient());

        // Verifica si se ha pasado una URL como parámetro
        String url = getIntent().getStringExtra(URL_EXTRA);
        if (url != null && !url.isEmpty()) {
            webView.loadUrl(url);
        }

        // Configura el diseño de la actividad
        setContentView(webView);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        webView.destroy();
    }

    public static final String URL_EXTRA = "url_extra";
}
