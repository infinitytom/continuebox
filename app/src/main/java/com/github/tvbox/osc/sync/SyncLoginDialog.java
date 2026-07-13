package com.github.tvbox.osc.sync;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;
import org.json.JSONObject;
import java.util.List;
import java.util.concurrent.Executors;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

public final class SyncLoginDialog {
 private SyncLoginDialog() {}
 public static void show(Context c) {
  LinearLayout box=new LinearLayout(c); box.setOrientation(LinearLayout.VERTICAL); box.setPadding(24,24,24,0);
  EditText e=new EditText(c); e.setHint("NAS地址和端口，例如 192.168.1.20:8080（默认HTTP）");
  List<SyncServerProfile> ps=SyncServerProfile.all(); if(!ps.isEmpty()){String s=ps.get(0).endpoint.replaceFirst("^https?://","");e.setText(s);}
  EditText u=new EditText(c);u.setHint("用户名"); EditText w=new EditText(c);w.setHint("密码");w.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);
  box.addView(e);box.addView(u);box.addView(w);
  AlertDialog d=new AlertDialog.Builder(c).setTitle("播放记录同步").setView(box).setNegativeButton("取消",null).setPositiveButton("登录",null).create();
  d.setOnShowListener(x->d.getButton(-1).setOnClickListener(v->auth(c,d,e,u,w,false))); d.setButton(-3,"注册",(x,y)->auth(c,d,e,u,w,true)); d.show();
 }
 private static void auth(Context c,AlertDialog d,EditText e,EditText u,EditText w,boolean reg){
  String input=e.getText().toString().trim().replaceAll("/$",""); final String base=(input.startsWith("http://")||input.startsWith("https://"))?input:"http://"+input;
  String user=u.getText().toString().trim(),pass=w.getText().toString(); if(base.length()<8||user.isEmpty()||pass.isEmpty()){Toast.makeText(c,"请填写完整信息",Toast.LENGTH_SHORT).show();return;}
  Executors.newSingleThreadExecutor().execute(()->{try{String body="{\"username\":\""+user+"\",\"password\":\""+pass+"}";Request q=new Request.Builder().url(base+(reg?"/api/v1/auth/register":"/api/v1/auth/login")).post(RequestBody.create(MediaType.parse("application/json"),body)).build();okhttp3.Response r=new OkHttpClient().newCall(q).execute();String s=r.body()==null?"":r.body().string();if(!r.isSuccessful())throw new Exception(s);SyncServerProfile.activate(new SyncServerProfile(user,base,new JSONObject(s).getString("token")));new Handler(Looper.getMainLooper()).post(()->{d.dismiss();Toast.makeText(c,"登录成功，服务器已保存",Toast.LENGTH_SHORT).show();});}catch(Exception ex){new Handler(Looper.getMainLooper()).post(()->Toast.makeText(c,ex.getMessage(),Toast.LENGTH_LONG).show());}});
 }
}
