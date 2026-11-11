package com.continuebox.universaltest;
import android.app.*;
import android.content.*;
import android.os.*;
import org.json.*;
import java.lang.reflect.*;
import android.view.View;
import android.widget.*;
public class UpdateTests extends Instrumentation {
 int count=0; Activity a; Class<?> checker; Method compare,candidate;
 void ok(boolean b,String msg){if(!b)throw new AssertionError(msg);count++;}
 JSONObject release(String tag)throws Exception{
  String v=tag.replaceFirst("^v","");return new JSONObject().put("tag_name",tag).put("assets",new JSONArray().put(new JSONObject().put("name","ContinueBox-"+v+"-universal.apk").put("state","uploaded").put("size",100).put("browser_download_url","https://github.com/infinitytom/continuebox/releases/download/"+tag+"/ContinueBox-"+v+"-universal.apk")));
 }
 Object pick(JSONObject r)throws Exception{return candidate.invoke(null,r,"2.2.6");}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{
  getTargetContext().getExternalFilesDir(null).mkdirs();
  a=startActivitySync(new Intent().setClassName("com.continuebox.tv","com.github.tvbox.osc.ui.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  checker=a.getClassLoader().loadClass("com.github.tvbox.osc.util.UpdateChecker");compare=checker.getMethod("compareVersions",String.class,String.class);candidate=checker.getMethod("candidate",JSONObject.class,String.class);
  for(String[] pair:new String[][]{{"2.2.10","2.2.9"},{"v2.3.0","2.2.99"},{"3.0.0","2.99.99"}})ok((Integer)compare.invoke(null,(Object[])pair)>0,"numeric ordering");
  ok((Integer)compare.invoke(null,"v2.2.6","2.2.6")==0,"equal version");
  ok(pick(release("v2.2.7"))!=null,"new universal accepted");
  ok(pick(release("v2.2.6"))==null,"same suppressed");ok(pick(release("v2.2.5"))==null,"downgrade suppressed");
  ok(pick(release("v2.2.7").put("prerelease",true))==null,"prerelease suppressed");ok(pick(release("v2.2.7").put("draft",true))==null,"draft suppressed");
  ok(pick(release("v2.2.7").put("assets",new JSONArray()))==null,"no asset suppressed");
  for(String key:new String[]{"name","state","browser_download_url"}){JSONObject r=release("v2.2.7");r.getJSONArray("assets").getJSONObject(0).put(key,"https://evil.invalid/test.apk");ok(pick(r)==null,"reject "+key);}
  JSONObject zero=release("v2.2.7");zero.getJSONArray("assets").getJSONObject(0).put("size",0);ok(pick(zero)==null,"zero length suppressed");
  for(String tag:new String[]{"","v2.2.7-beta","invalid","2.2","9999999.0.0"})try{compare.invoke(null,tag,"2.2.6");throw new AssertionError("malformed accepted");}catch(InvocationTargetException good){ok(good.getCause() instanceof IllegalArgumentException,"invalid version rejected");}
  SharedPreferences prefs=a.getSharedPreferences("continuebox_updates",0);prefs.edit().putBoolean("auto",false).putLong("last_attempt",123).commit();checker.getMethod("onResume",Activity.class).invoke(null,a);ok(prefs.getLong("last_attempt",0)==123,"disabled check does not request");
  prefs.edit().putBoolean("auto",true).putLong("last_success",System.currentTimeMillis()).commit();checker.getMethod("onResume",Activity.class).invoke(null,a);ok(prefs.getLong("last_attempt",0)==123,"daily throttle");
  final Dialog[] about=new Dialog[1];final Throwable[] fail=new Throwable[1];runOnMainSync(()->{try{about[0]=(Dialog)a.getClassLoader().loadClass("com.github.tvbox.osc.ui.dialog.AboutDialog").getConstructor(Context.class).newInstance(a);about[0].show();}catch(Throwable e){fail[0]=e;}});if(fail[0]!=null)throw new RuntimeException(fail[0]);
  ViewGroupSearch search=new ViewGroupSearch();search.walk(about[0].findViewById(android.R.id.content));ok(search.button!=null,"about manual update entry");ok(search.toggle!=null,"about auto update entry");
  runOnMainSync(()->search.toggle.setChecked(false));ok(!prefs.getBoolean("auto",true),"auto setting persists");
  Thread.sleep(300);getUiAutomation().takeScreenshot().compress(android.graphics.Bitmap.CompressFormat.PNG,100,new java.io.FileOutputStream("/sdcard/Android/data/com.continuebox.tv/files/update-about.png"));
  runOnMainSync(()->about[0].dismiss());
  runOnMainSync(()->{try{a.getClassLoader().loadClass("com.github.tvbox.osc.util.CloudPortal").getMethod("show",Context.class,Object.class).invoke(null,a,a);}catch(Throwable e){fail[0]=e;}});if(fail[0]!=null)throw new RuntimeException(fail[0]);
  Thread.sleep(500);ok(getUiAutomation().getRootInActiveWindow().findAccessibilityNodeInfosByText("网盘配置").size()>0,"correct home login instructions");
  getUiAutomation().takeScreenshot().compress(android.graphics.Bitmap.CompressFormat.PNG,100,new java.io.FileOutputStream("/sdcard/Android/data/com.continuebox.tv/files/cloud-help.png"));
  out.putString("stream",count+" update/identity/help checks passed\n");finish(-1,out);
 }catch(Throwable e){java.io.StringWriter sw=new java.io.StringWriter();e.printStackTrace(new java.io.PrintWriter(sw));out.putString("stream",sw.toString());finish(1,out);}}
 static class ViewGroupSearch{Button button;CheckBox toggle;void walk(View v){if(v instanceof CheckBox)toggle=(CheckBox)v;else if(v instanceof Button&&"检查软件更新".contentEquals(((Button)v).getText()))button=(Button)v;if(v instanceof android.view.ViewGroup){android.view.ViewGroup g=(android.view.ViewGroup)v;for(int i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}}
}
