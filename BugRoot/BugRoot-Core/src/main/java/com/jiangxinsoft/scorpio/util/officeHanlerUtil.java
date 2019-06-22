package com.jiangxinsoft.scorpio.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.xml.sax.SAXException;


public class officeHanlerUtil {
	
	private final static int MAX_CONTENT = 100;
	
	/**
	 * getWord/txt
	 * @param file
	 * @return
	 */
	public static String getContent(File file) {
		
		Tika tika = new Tika();
		tika. setMaxStringLength (MAX_CONTENT);
		String filecontent = null;
		try {
			filecontent = tika.parseToString(file);
		} catch (IOException | TikaException e) {
			e.printStackTrace();
		}
		return filecontent;
	}
	
	/**
	 * @throws TikaException 
	 * @throws IOException 
	 * @throws SAXException 
	 * 
	 * 
	 */
	public static String getPdfContent(File pdfFile) throws IOException, TikaException, SAXException {
		
		
		String path = "src//Resource//temp.pdf";
		File file = new File(path);
		
		Tika tika = new Tika();
		tika. setMaxStringLength(MAX_CONTENT);
		
		String filecontent = tika.parseToString(file);
		
		InputStream  input=new FileInputStream(file);
	    BodyContentHandler textHandler= new BodyContentHandler();
	    
	    Metadata matadata=new Metadata();
	   
	    Parser parser=new AutoDetectParser();
	    ParseContext context=new ParseContext();
	    
	    parser.parse(input, textHandler, matadata, context);
	    input.close();
	    
	    String[] names = matadata.names();
	    for(String name : names) {
	         System.out.println(name + " : " + matadata.get(name));
	      }
	    System.out.println("AUTHOR: " + matadata.get("Author"));
	    System.out.println("Type: " + matadata.get("TYPE"));
	    System.out.println("Type: " + matadata.get("Application-Name"));
	    
	    System.out.println("Body: " + filecontent);
	    
		return null;
	}
	
   
}
