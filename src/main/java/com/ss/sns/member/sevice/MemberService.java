package com.ss.sns.member.sevice;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.mapper.MemberMapper;

@Service
@PropertySource("classpath:application-API-KEY.properties")
public class MemberService {
	@Autowired
	MemberMapper membermapper;
	@Value("${kakao-client-id}")
	String kakao_client_id;
	@Value("${kakao-client-secret}")
	String kakao_client_secret;

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

		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + kakao_client_id);
			sb.append("&redirect_uri=http://localhost:8080/sns/kakao/login");
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
				userInfo.put("nickname", pro.get("nickname").toString());
				userInfo.put("email", kakaoAcount.get("email").toString());
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

}
