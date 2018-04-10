package edu.iot.butter.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileUtil {
	//지정한 파일을 브라우저로 전송
	public static void copy(String path,
							HttpServletResponse response) {
		try( InputStream in = new BufferedInputStream(
								new FileInputStream(path));
			OutputStream out = new BufferedOutputStream(
								response.getOutputStream());
		){
			copy(in,out);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void copy(InputStream in, OutputStream out)
			throws Exception{
		BufferedInputStream bis = new BufferedInputStream(in);
		BufferedOutputStream bos = new BufferedOutputStream(out);
		int data;
		while((data=bis.read())!=-1) {
			bos.write(data);
		}
		bos.flush();
	}
}
