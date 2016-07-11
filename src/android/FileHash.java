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

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.StringTokenizer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 *
 * @author LordKBX
 */
public class FileHash extends CordovaPlugin {

	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);
	}
	
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		final String url = args.getString(0);
		JSONObject r = new JSONObject();
		r.put("file", url);
        if (action.equals("md2")){
			r.put("result", md2(url));
			callbackContext.success(r);
			return true;
		}
        if (action.equals("md5")){
			r.put("result", md5(url));
			callbackContext.success(r);
			return true;
		}
        if (action.equals("sha1")){
			r.put("result", sha1(url));
			callbackContext.success(r);
			return true;
		}
        if (action.equals("sha256")){
			r.put("result", sha256(url));
			callbackContext.success(r);
			return true;
		}
        if (action.equals("sha384")){
			r.put("result", sha384(url));
			callbackContext.success(r);
			return true;
		}
        if (action.equals("sha512")){
			r.put("result", sha512(url));
			callbackContext.success(r);
			return true;
		}
    return false;
    }

	public String sha1(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}

	public String sha256(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}

	public String sha384(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-384");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}

	public String sha512(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}

	public String md2(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("MD2");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}

	public String md5(String fileURL) {
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			FileInputStream fis = new FileInputStream(fileURL);
			byte[] dataBytes = new byte[1024];
			int nread = 0; 
			while ((nread = fis.read(dataBytes)) != -1){ md.update(dataBytes, 0, nread); };
			byte[] mdbytes = md.digest();
			//convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) { sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1)); }
			return sb.toString();
			}
		catch(Exception ex){
			return "";
			}
		}
		
}
