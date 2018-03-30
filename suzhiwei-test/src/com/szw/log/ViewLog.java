package com.szw.log;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * http://127.0.0.1:8080/suzhiwei-test/quartz/readLog
 * @author suzhiwei
 * 读取服务器日志
 */
@Controller
@RequestMapping("/quartz")
public class ViewLog {
	/**
	 * log
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(ViewLog.class);
	
	@RequestMapping("/log")
	public String index() {
		return "log";
	}
	 
    // 文件内容的总行数。  
    public static int getTotalLines(File file) throws IOException {  
        FileReader in = new FileReader(file);  
        LineNumberReader reader = new LineNumberReader(in);  
        String s = reader.readLine();  
        int lines = 0;  
        while (s != null) {  
            lines++;  
            s = reader.readLine();  
        }  
        reader.close();  
        in.close();  
        return lines;  
    } 
    
	
	@RequestMapping(value = "/readLog", method = RequestMethod.GET)
	@ResponseBody
	public List<String> readlog(HttpServletResponse response) throws IOException {
		FileReader in  = null;
		LineNumberReader reader = null;
		List<String> list;
		response.setCharacterEncoding("UTF-8");
			try {
				//System.getProperty("catalina.home")  //Tomcat 安装目录
				//System.getProperty("file.separator")); // 文件分隔符
				String filePath = System.getProperty("catalina.home")+System.getProperty("file.separator")+"WEB-INF"+System.getProperty("file.separator")+"logs"+System.getProperty("file.separator")+"runningLog"+System.getProperty("file.separator")+"tmp.log";
				File file = new File(filePath);
				if(!file.exists()){
					LOGGER.debug("指定文件不存在");
				}
					int totalLineNumber = getTotalLines(file);
					int needNumberLocation = 0;
					if(totalLineNumber<=1000) {
						needNumberLocation = 0;
					}else {
						needNumberLocation = totalLineNumber-1000;
					}
					list = new ArrayList<String>();
		        in = new FileReader(file);  
		        reader = new LineNumberReader(in); 
		        int lines = 0; 
		        String s = "";
		        while (s != null) {  
		            lines++;  
		            s = reader.readLine();  
		            if(needNumberLocation<lines&&lines<=totalLineNumber) {  
		            	list.add(s);
		            }  
		        } 
				return list;
			} catch (Exception e) {
				LOGGER.debug(e.getMessage());
			}finally{
				if(in!=null)
					in.close();
				if(reader!= null)
					reader.close();
			}
			return null;
	}
}
