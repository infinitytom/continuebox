package com.github.tvbox.osc.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.atomic.AtomicBoolean;

/** Checks only public release metadata. Never uploads account/configuration information. */
public final class UpdateChecker {
    public static final String LATEST = "https://github.com/infinitytom/continuebox/releases/latest";
    private static final String API = "https://api.github.com/repos/infinitytom/continuebox/releases/latest";
    private static final AtomicBoolean RUNNING = new AtomicBoolean();
    private UpdateChecker() {}
    private static SharedPreferences prefs(Context c) { return c.getSharedPreferences("continuebox_updates", 0); }
    public static void onResume(Activity a) {
        SharedPreferences p=prefs(a);long now=System.currentTimeMillis();
        if(!p.getBoolean("auto",true))return;
        long last=p.getLong("last_success",0),attempt=p.getLong("last_attempt",0);
        if((now>=last && now-last<86400000L)||(now>=attempt && now-attempt<3600000L))return;
        check(a,false);
    }
    public static String version(Context c) {
        try{return c.getPackageManager().getPackageInfo(c.getPackageName(),0).versionName;}catch(Exception e){return "0.0.0";}
    }
    /** Only stable numeric versions; do not compare names lexicographically. */
    public static int compareVersions(String a,String b) {
        int[] av=parts(a),bv=parts(b);
        for(int i=0;i<3;i++){int d=Integer.compare(av[i],bv[i]);if(d!=0)return d;}
        return 0;
    }
    private static int[] parts(String s) {
        if(s==null||!s.matches("v?[0-9]{1,6}\\.[0-9]{1,6}\\.[0-9]{1,6}"))throw new IllegalArgumentException("Invalid stable version");
        String[] p=s.replaceFirst("^v","").split("\\.");return new int[]{Integer.parseInt(p[0]),Integer.parseInt(p[1]),Integer.parseInt(p[2])};
    }
    /** null for old, prerelease or incomplete releases. Exact universal asset only. */
    public static String[] candidate(JSONObject r,String current) throws Exception {
        if(r.optBoolean("draft")||r.optBoolean("prerelease"))return null;
        String tag=r.optString("tag_name");if(compareVersions(tag,current)<=0)return null;
        String v=tag.replaceFirst("^v","");String name="ContinueBox-"+v+"-universal.apk";
        JSONArray assets=r.optJSONArray("assets");if(assets==null)return null;
        String expected="https://github.com/infinitytom/continuebox/releases/download/"+tag+"/"+name;
        for(int i=0;i<assets.length();i++) {
            JSONObject asset=assets.getJSONObject(i);
            if(name.equals(asset.optString("name"))&&"uploaded".equals(asset.optString("state"))&&asset.optLong("size")>0&&expected.equals(asset.optString("browser_download_url")))
                return new String[]{v,expected};
        }
        return null;
    }
    private static JSONObject fetch() throws Exception {
        HttpURLConnection conn=(HttpURLConnection)new URL(API).openConnection();
        conn.setConnectTimeout(8000);conn.setReadTimeout(8000);conn.setInstanceFollowRedirects(false);
        conn.setRequestProperty("Accept","application/vnd.github+json");conn.setRequestProperty("User-Agent","ContinueBox-UpdateCheck");
        try {
            if(conn.getResponseCode()!=200)throw new Exception("Release unavailable");
            try(InputStream in=conn.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()) {
                byte[] buf=new byte[8192];int n;
                while((n=in.read(buf))!=-1){if(out.size()+n>524288)throw new Exception("Response too large");out.write(buf,0,n);}
                return new JSONObject(out.toString("UTF-8"));
            }
        } finally {conn.disconnect();}
    }
    public static void check(Activity a,boolean manual) {
        if(!RUNNING.compareAndSet(false,true)){if(manual)Toast.makeText(a,"正在检查更新",Toast.LENGTH_SHORT).show();return;}
        prefs(a).edit().putLong("last_attempt",System.currentTimeMillis()).apply();
        if(manual)Toast.makeText(a,"正在检查 GitHub 正式版更新…",Toast.LENGTH_SHORT).show();
        new Thread(()->{
            String[] found=null;boolean ok=false;
            try{found=candidate(fetch(),version(a));ok=true;prefs(a).edit().putLong("last_success",System.currentTimeMillis()).apply();}catch(Exception ignored){}
            final String[] next=found;final boolean success=ok;
            a.runOnUiThread(()->{
                RUNNING.set(false);
                if(a.isFinishing()||a.isDestroyed())return;
                if(next!=null)showUpdate(a,next[0],next[1]);
                else if(manual)new AlertDialog.Builder(a).setTitle(success?"已是最新正式版":"暂时无法检查更新")
                    .setMessage(success?"当前安装版本："+version(a):"GitHub 可能暂时不可达或请求受限。稍后再试，不影响正常播放。也可用手机打开：\n"+LATEST)
                    .setPositiveButton("打开发布页",(d,w)->open(a,LATEST)).setNegativeButton("关闭",null).show();
            });
        },"ContinueBox-update").start();
    }
    private static void showUpdate(Activity a,String v,String url) {
        new AlertDialog.Builder(a).setTitle("发现新版本 "+v)
            .setMessage("当前版本："+version(a)+"\n将打开官方 GitHub universal 安装包下载地址，安装仍需你确认。不会自动安装。\n\n电视没有浏览器时，请用手机打开发布页，下载后推送到电视：\n"+LATEST)
            .setPositiveButton("下载 universal 包",(d,w)->open(a,url))
            .setNeutralButton("发布说明",(d,w)->open(a,LATEST)).setNegativeButton("稍后",null).show();
    }
    private static void open(Activity a,String url) {
        try{a.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(url)));}
        catch(Exception e){new AlertDialog.Builder(a).setTitle("请用手机下载后推送到电视").setMessage(LATEST).setPositiveButton("知道了",null).show();}
    }
    public static void attach(Dialog dialog,Context context) {
        if(!(context instanceof Activity))return;
        ViewGroup content=dialog.findViewById(android.R.id.content);
        if(content==null||content.getChildCount()==0||!(content.getChildAt(0) instanceof LinearLayout))return;
        LinearLayout root=(LinearLayout)content.getChildAt(0);Activity a=(Activity)context;
        TextView label=new TextView(a);label.setText("续映 "+version(a)+" · universal");label.setTextColor(0xffdddddd);label.setTextSize(18);root.addView(label);
        CheckBox auto=new CheckBox(a);auto.setText("自动检查软件更新（每天最多检查一次）");auto.setTextColor(0xffdddddd);auto.setTextSize(18);auto.setChecked(prefs(a).getBoolean("auto",true));
        auto.setOnCheckedChangeListener((b,on)->prefs(a).edit().putBoolean("auto",on).apply());root.addView(auto);
        Button check=new Button(a);check.setText("检查软件更新");check.setTextSize(20);check.setMinimumHeight((int)(56*a.getResources().getDisplayMetrics().density));check.setOnClickListener(v->{dialog.dismiss();check(a,true);});root.addView(check);
    }
}
