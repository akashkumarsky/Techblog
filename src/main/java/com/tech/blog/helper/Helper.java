package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.StringBuilder;

public class Helper {
	public static boolean deleteFile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public static boolean saveFile(InputStream is, String path) {
		boolean f= false;
		try {
			byte b[] = new byte[is.available()];
			is.read(b);
			FileOutputStream fos= new FileOutputStream(path);
			fos.write(b);
			
			fos.flush();
			fos.close();
			 
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

    // Helper method to limit the number of words in a given content
    public static String limitWords(String content, int numberOfWords) {
    	String result =null;
    	try {
        String[] words = content.split("\\s+");
        StringBuilder result1 = new StringBuilder();

        for (int i = 0; i < numberOfWords && i < words.length; i++) {
            result1.append(words[i]).append(" ");
        }
    
        return result1.toString().trim();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return result;
    }


	
	
}
