package com.spring.openapi.data.service;

import java.net.URLEncoder;

import org.springframework.stereotype.Service;

import com.spring.common.openapi.URLConnectUtil;
import com.spring.openai.data.vo.OpenApiDTO;

@Service
public class DataServiceImpl implements DataService {
	

	/*@Override
	public StringBuffer chungnamList() throws Exception {
		
		String site = "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=10";
		
//		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
//		site.append("?"+URLEncoder.encode("func", "UTF-8")+"="+URLEncoder.encode("tour", "UTF-8"));
//		site.append("&"+URLEncoder.encode("start", "UTF-8")+"="+URLEncoder.encode("1", "UTF-8"));
//		site.append("&"+URLEncoder.encode("end", "UTF-8")+"="+URLEncoder.encode("10", "UTF-8"));
		
		URL url = new URL(site.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");	// 요청 방식 선택
		// 서버 Responese Data를 xml(application/xml), json(application/json) 형식의 타입으로 요청
		conn.setRequestProperty("Accept", "application/xml");
		
		int resCode = conn.getResponseCode();
		System.out.println("응답코드 "+resCode);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer output = new StringBuffer();
		
		while((inputLine = in.readLine()) != null) {
			output.append(inputLine);
		}
		
		return output;
	}*/
	
	@Override
	public StringBuffer chungnamList() throws Exception {
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?"+URLEncoder.encode("func", "UTF-8")+"="+URLEncoder.encode("tour", "UTF-8"));
		site.append("&"+URLEncoder.encode("start", "UTF-8")+"="+URLEncoder.encode("1", "UTF-8"));
		site.append("&"+URLEncoder.encode("end", "UTF-8")+"="+URLEncoder.encode("10", "UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		
		return result;
	}
	
	@Override
	public StringBuffer chungnamDetail(String mng_no) throws Exception {
//		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no="+mng_no);
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?"+URLEncoder.encode("func", "UTF-8")+"="+URLEncoder.encode("tour", "UTF-8"));
		site.append("&"+URLEncoder.encode("mode", "UTF-8")+"="+URLEncoder.encode("V", "UTF-8"));
		site.append("&"+URLEncoder.encode("mng_no", "UTF-8")+"="+URLEncoder.encode(mng_no, "UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", null, null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}


}
