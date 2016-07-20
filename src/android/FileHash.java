/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lordkbx.FileHash;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.Config;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaHttpAuthHandler;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginManager;
import org.apache.cordova.PluginResult;

import android.app.Activity;
import android.content.Context;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.StringTokenizer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.net.URLDecoder;
/**
 *
 * @author LordKBX
 */
public class FileHash extends CordovaPlugin {
	
	private String AppId;
	private Context context;
	private String[] errorCodes = {"Execution Error", "Unknown Algorithm", "File not found", "File access error", "Digest error"};

	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);
		this.webView = webView;
		Activity activity = cordova.getActivity();
		this.context = activity.getApplicationContext();
		this.AppId = context.getPackageName();
	}
	
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		String url = args.getString(0);
		url = URLDecoder.decode(url);
		System.out.println("File root system "+context.getPackageName());
		JSONObject r = new JSONObject();
		String ealgo = "";
		if (action.equals("md2")){ealgo = "MD2";}
		if (action.equals("md5")){ealgo = "MD5";}
		if (action.equals("sha1")){ealgo = "SHA-1";}
		if (action.equals("sha256")){ealgo = "SHA-256";}
		if (action.equals("sha384")){ealgo = "SHA-384";}
		if (action.equals("sha512")){ealgo = "SHA-512";}
        if (action.equals("md2") || action.equals("md5") || action.equals("sha1") || action.equals("sha256") || action.equals("sha384") || action.equals("sha512")){
			String[] rez = central(url, ealgo);
			if(rez[1] == ""){
				r.put("file", url);
				r.put("algo", ealgo);
				r.put("result", rez[0]);
				callbackContext.success(r);
				}
			else{ 
				r.put("code", rez[0]);
				r.put("message", rez[1]);
				callbackContext.error(r); 
				}
			}
		else{ r.put("code", 1); r.put("message", this.errorCodes[1]); callbackContext.error(r);}
		return true;
		}

		
	//java.io.FileNotFoundException
	public String[] central(String fileURL, String algo){
		FileInputStream fis;
		String[] ret = {"",""};
		try{
			if(fileURL.contains("file:///android_asset/")){
				fileURL = fileURL.replace("file:///android_asset/", "");
				String[] tab = fileURL.split("/");
				String endUrl = "/data/data/" + this.AppId + "/cache/" + fileURL.replace("/","_");
				
					InputStream in = this.context.getAssets().open(fileURL);
					OutputStream out = new FileOutputStream(endUrl);
					
					// Transfer bytes from in to out
					byte[] buf = new byte[1024];
					int len; while ((len = in.read(buf)) > 0) out.write(buf, 0, len);
					in.close(); out.close();
				fileURL = endUrl;
				}
			else{ fileURL = fileURL.replace("file:///", "/").replace("file:", "");}
		
			fis = new FileInputStream(fileURL);
			MessageDigest md = MessageDigest.getInstance(algo);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			ret[0] = sb.toString();
			System.out.println(sb.toString());
			return ret;
			}
		catch(Exception ex){
			if(ex instanceof FileNotFoundException){
				File f = new File(fileURL);
				if(f.exists()){ret[0] = Integer.toString(3); ret[1] = this.errorCodes[3];}
				else{ret[0] = Integer.toString(2); ret[1] = this.errorCodes[2];}
				return ret;
				}
			else{System.out.println(ex); ret[0] = Integer.toString(4); ret[1] = this.errorCodes[4]; return ret;}
			}
		
		
		}
		
}
