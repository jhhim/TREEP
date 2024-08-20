package com.ss.sns.member.sevice;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.mapper.MemberMapper;
import com.ss.sns.trip.dto.shareBO;

@Service
@PropertySource("classpath:application-API-KEY.properties")
public class MemberService {
	@Autowired
	MemberMapper membermapper;
	@Value("${kakao-client-id}")
	String kakao_client_id;
	@Value("${kakao-client-secret}")
	String kakao_client_secret;
	@Value("${kakao_redirect_uri}")
	String kakao_redirect_uri;
	@Value("${naver-client-id}")
	String naver_client_id;
	@Value("${naver_secret}")
	String naver_secret;
	@Value("${naver_callback}")
	String naver_callback;
	@Value("${google-client-id}")
	String google_client_id;
	@Value("${google-secret}")
	String google_secret;
	@Value("${google-redirect-uri}")
	String google_callback;
	public Map<String, String> getApiKeys() {
        Map<String, String> apiKeys = new HashMap<>();
        apiKeys.put("kakaoClientId", kakao_client_id);
        apiKeys.put("kakaoClientSecret", kakao_client_secret);
        apiKeys.put("kakaoRedirectUri", kakao_redirect_uri);
        apiKeys.put("naverClientId", naver_client_id);
        apiKeys.put("naverSecret", naver_secret);
        apiKeys.put("naverCallback", naver_callback);
        apiKeys.put("googleClientId", google_client_id);
        apiKeys.put("googleSecret", google_secret);
        apiKeys.put("googleCallback", google_callback);
        return apiKeys;
    }
	
	public void memberSignup(MemberDTO member) throws Exception {
		membermapper.memberSignup(member);
	}

	public MemberDTO memberLogin(MemberDTO member) throws Exception {

		return membermapper.memberLogin(member);

	}

	public int idcheck(String member_id) {

		return membermapper.idcheck(member_id);
	}

	public int memberNicknameChk(String member_nickname) {

		return membermapper.nicknamecheck(member_nickname);
	}

	public int memberemailChk(String member_email) {

		return membermapper.emailcheck(member_email);
	}

	public String kakaoGetToken(String code, Model model) {
		String host = "https://kauth.kakao.com/oauth/token";
		String token = "";
		model.addAttribute("kakao_client_id", kakao_client_id);
		model.addAttribute("kakao_redirect_uri", kakao_redirect_uri);
		model.addAttribute("client_secret", kakao_client_secret);
		
		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + kakao_client_id);
			sb.append("&redirect_uri=" + kakao_redirect_uri);
			sb.append("&code=" + code);
			sb.append("&client_secret=" + kakao_client_secret);

			// System.out.println(sb.toString());
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("응답 : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// System.out.println("Result :" +result);
			JSONParser parser = new JSONParser();
			JSONObject elements = (JSONObject) parser.parse(result);
			String access_token = elements.get("access_token").toString();
			token = access_token;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}

	public HashMap<String, String> getUserInfo(String token) {

		System.out.println("getUserInfo()");
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String host = "https://kapi.kakao.com/v2/user/me";
		String nickname = "";
		try {

			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();
			System.out.println("응답코드:" + responseCode);
			System.out.println(con.getResponseMessage());

			if (responseCode == 200) {
				// json parsing

				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;

				}

				System.out.println("result2:" + result);

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				JSONObject pro = (JSONObject) obj.get("properties");
				JSONObject kakaoAcount = (JSONObject) obj.get("kakao_account");
				System.out.println(pro);
				System.out.println(kakaoAcount);
				userInfo.put("nickname", pro.get("nickname").toString());
				userInfo.put("email", kakaoAcount.get("email").toString());
				userInfo.put("birthday", kakaoAcount.get("birthday").toString());
				userInfo.put("birthyear", kakaoAcount.get("birthyear").toString());
				userInfo.put("gender", kakaoAcount.get("gender").toString());
				userInfo.put("name", kakaoAcount.get("name").toString());
				userInfo.put("phone_number", kakaoAcount.get("phone_number").toString());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userInfo;
	}
	public int kakaocheck(String kakao_email) {
		
		int result = membermapper.kakaocheck(kakao_email);
		
		return result;
	}
	public void getkakaofirends(String token) {
		JSONObject resultObj;
		
		System.out.println("getkakaofirends()");
		String host = "https://kapi.kakao.com/v1/api/talk/friends";
		try {

			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();
			System.out.println("응답코드:" + responseCode);
			System.out.println(con.getResponseMessage());

			if (responseCode == 200) {
				// json parsing

				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;

				}

				System.out.println("result2:" + result);

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				System.out.println(obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
public void kakaoSignup(MemberDTO member) {
	membermapper.kakaoSignup(member);
}
	public void unlink(String token) {

		System.out.println("unlink()");

		String host = "https://kapi.kakao.com/v1/user/unlink";

		try {

			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();
			System.out.println("응답코드:" + responseCode);

			// 응답을 할 때 종료된 id값이 반환된다.
			// id값을 확인
			// Response: {"id":3638009163}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public String naverGetToken(String code, Model model) {
		String host = "https://nid.naver.com/oauth2.0/token";
		String token = "";

		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + naver_client_id);
			sb.append("&client_secret=" + naver_secret);
			sb.append("&code=" + code);
			sb.append("&state=1234");
			
			
			

			System.out.println(sb.toString());
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("응답 : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// System.out.println("Result :" +result);
			JSONParser parser = new JSONParser();
			JSONObject elements = (JSONObject) parser.parse(result);
			
			String access_token = elements.get("access_token").toString();
			token = access_token;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}
	public HashMap<String, String> getNaverUserInfo(String token) {

		System.out.println("getUserInfo()");
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String host = "https://openapi.naver.com/v1/nid/me";
		String nickname = "";
		try {

			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();
			System.out.println("응답코드:" + responseCode);
			System.out.println(con.getResponseMessage());

			if (responseCode == 200) {
				// json parsing

				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;

				}

				System.out.println("result2:" + result);

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				JSONObject res = (JSONObject) obj.get("response");
				System.out.println(res);
				
			
				userInfo.put("id", res.get("id").toString());
				userInfo.put("nickname", res.get("nickname").toString());
				userInfo.put("gender", res.get("gender").toString());
				userInfo.put("email", res.get("email").toString());
				userInfo.put("mobile", res.get("mobile").toString());
				userInfo.put("name", res.get("name").toString());
				userInfo.put("birthday", res.get("birthday").toString());
				userInfo.put("birthyear", res.get("birthyear").toString());
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userInfo;
	}
	public void naverSignup(MemberDTO member) {
		membermapper.naverSignup(member);
	}
	public String googleGetToken(String code, Model model) {
		String host = "https://oauth2.googleapis.com/token";
		String token = "";

		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("code=" + code);
			sb.append("&client_id=" + google_client_id);
			sb.append("&client_secret=" + google_secret);
			sb.append("&grant_type=authorization_code");
			sb.append("&redirect_uri="+ google_callback);
			
			
			

			//System.out.println(sb.toString());
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("응답 : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			//System.out.println("Result :" +result);
			JSONParser parser = new JSONParser();
			JSONObject elements = (JSONObject) parser.parse(result);
			
			String access_token = elements.get("access_token").toString();
			token = access_token;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}
	public HashMap<String, String> getGoogleUserInfo(String token) {

		System.out.println("getUserInfo()");
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String host = "https://people.googleapis.com/v1/people/me?personFields=names,emailAddresses,phoneNumbers";
		try {

			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);
			
			int responseCode = con.getResponseCode();
			System.out.println("응답코드:" + responseCode);
			System.out.println(con.getResponseMessage());

			if (responseCode == 200) {
				// json parsing

				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;

				}

				System.out.println("result2:" + result);

				JSONParser parser = new JSONParser();
	            JSONObject obj = (JSONObject) parser.parse(result.toString());

	            // Parse emailAddresses
	            JSONArray emailAddresses = (JSONArray) obj.get("emailAddresses");
	            if (emailAddresses != null && !emailAddresses.isEmpty()) {
	                JSONObject emailObject = (JSONObject) emailAddresses.get(0);
	                userInfo.put("email",emailObject.get("value").toString());
	                
	            }

	            // Parse names
	            JSONArray names = (JSONArray) obj.get("names");
	            if (names != null && !names.isEmpty()) {
	                JSONObject nameObject = (JSONObject) names.get(0);
	                
	                userInfo.put("name", nameObject.get("displayName").toString());
	               
	            }
	            
	            userInfo.put("id", obj.get("resourceName").toString().substring(7));
				
				
			
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userInfo;
	}

	public void googleSignup(MemberDTO member) {
		membermapper.googleSignup(member);
		
	}
	public MemberDTO kakaomemberCheck(MemberDTO member) {
		return	membermapper.kakaomemberCheck(member);	
		}
	public MemberDTO navermemberCheck(MemberDTO member) {
		return	membermapper.navermemberCheck(member);	
		}
	public MemberDTO googlememberCheck(MemberDTO member) {
		return	membermapper.googlememberCheck(member);	
		}

	public MemberDTO getmemberbyEmail(String email) {
		// TODO Auto-generated method stub
		return membermapper.getmemberbyEmail(email);	
	}
	public shareBO getShareInfo(int trip_no) {
		return membermapper.getShareInfo(trip_no);
	}

	public void changePW(MemberDTO member) {
		membermapper.changePW(member);
		
	}
	
}
