package com.github.tvbox.osc.sync;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.orhanobut.hawk.Hawk;
import java.util.ArrayList;
import java.util.List;
public class SyncServerProfile {
    private static final String PROFILES = "sync_server_profiles";
    public String name, endpoint, token; public long lastUsed;
    public SyncServerProfile() { }
    public SyncServerProfile(String n, String e, String t) { name=n; endpoint=e; token=t; lastUsed=System.currentTimeMillis(); }
    public static List<SyncServerProfile> all() { List<SyncServerProfile> x=new Gson().fromJson(Hawk.get(PROFILES,"[]"),new TypeToken<List<SyncServerProfile>>(){}.getType()); return x==null?new ArrayList<SyncServerProfile>():x; }
    public static void save(SyncServerProfile p) { List<SyncServerProfile> x=all(); for(int i=x.size()-1;i>=0;i--) if(sameAccount(x.get(i),p)) x.remove(i); x.add(0,p); while(x.size()>10)x.remove(x.size()-1); Hawk.put(PROFILES,new Gson().toJson(x)); }
    public static void activate(SyncServerProfile p) { p.lastUsed=System.currentTimeMillis(); Hawk.put("sync_endpoint",p.endpoint); Hawk.put("sync_token",p.token); Hawk.put("sync_account_name",p.name); save(p); }
    private static boolean sameAccount(SyncServerProfile a, SyncServerProfile b) {
        return a != null && b != null && safe(a.endpoint).equalsIgnoreCase(safe(b.endpoint))
                && safe(a.name).equalsIgnoreCase(safe(b.name));
    }
    private static String safe(String value) { return value == null ? "" : value.trim(); }
}
