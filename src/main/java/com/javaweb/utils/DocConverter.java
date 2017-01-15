package com.javaweb.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;


/**
 * 文件转化预览
 * @author cp
 *
 */
public class DocConverter {
	private static final int environment = 1; 
	@SuppressWarnings("unused")
	private String fileString; 
	@SuppressWarnings("unused")
	private String outputPath = ""; 
	private String fileName;
	private File pdfFile;
	private File swfFile;
	private File docFile;
	
	public DocConverter(String fileString) {
		ini(fileString);
	}

	/**
	 * 閲嶆柊璁剧疆file
	 * 
	 * @param fileString
	 */
	public void setFile(String fileString) {
		ini(fileString);
	}

	/**
	 * 鍒濆鍖�
	 * 
	 * @param fileString
	 */
	private void ini(String fileString) {
		this.fileString = fileString;
		fileName = fileString.substring(0, fileString.lastIndexOf("."));
		docFile = new File(fileString);
		pdfFile = new File(fileName + ".pdf");
		swfFile = new File(fileName + ".swf");
	}
	
	/**
	 * 杞负PDF
	 * 
	 * @param file
	 */
	private void doc2pdf() throws Exception {
		if (docFile.exists()) {
			if (!pdfFile.exists()) {
				OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				try {
					connection.connect();
					DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
					converter.convert(docFile, pdfFile);
					// close the connection
					connection.disconnect();				 
				} catch (java.net.ConnectException e) {
					e.printStackTrace();				 
					throw e;
				} catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
					e.printStackTrace();			 
					throw e;
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			} else {
				//System.out.println("转化失败");
			}
		} else {
			System.out.println("文件不存在");
		}
	}
	
	/**
	 * 杞崲鎴� swf
	 */
	@SuppressWarnings("unused")
	private void pdf2swf() throws Exception {
		Runtime r = Runtime.getRuntime();
		if (!swfFile.exists()) {
			if (pdfFile.exists()) {
				if (1 == environment) { 
					try {
						Process p = r.exec("D:/FILE_LOAD/swftools/pdf2swf.exe "+ pdfFile.getPath() + " -o "+ swfFile.getPath() + " -T 9");
						System.out.print(loadStream(p.getInputStream()));
						System.err.print(loadStream(p.getErrorStream()));
						System.out.print(loadStream(p.getInputStream()));						 
						if (pdfFile.exists()) {
							pdfFile.delete();
						}

					} catch (IOException e) {
						e.printStackTrace();
						throw e;
					}
				} else if (environment == 2) { 
					try {
						Process p = r.exec("pdf2swf " + pdfFile.getPath()
								+ " -o " + swfFile.getPath() + " -T 9");
						System.out.print(loadStream(p.getInputStream()));
						System.err.print(loadStream(p.getErrorStream()));					 
						if (pdfFile.exists()) {
							pdfFile.delete();
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			} else {
				 
			}
		} else {
			System.out.println("文件不存在");
		}
	}

	static String loadStream(InputStream in) throws IOException {

		int ptr = 0;
		in = new BufferedInputStream(in);
		StringBuffer buffer = new StringBuffer();

		while ((ptr = in.read()) != -1) {
			buffer.append((char) ptr);
		}

		return buffer.toString();
	}
	
	
	/**
	 * 转化
	 * @return
	 */
	@SuppressWarnings("unused")
	public boolean conver() {

		if (swfFile.exists()) {
			System.out.println("文件转化成功");
			return true;
		}
		if (environment==1) {
			System.out.println("windows环境");
		} else {
			System.out.println("linux环境");
		}
		try {
			doc2pdf();
			pdf2swf();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		if (swfFile.exists()) {
			return true;
		} else {
			return false;
		}
	}

	
	/**
	 * 获取swf文件的路径
	 * @return
	 */
	public String getswfPath() {
		if (swfFile.exists()) {
			String tempString = swfFile.getPath();
			tempString = tempString.replaceAll("\\\\", "/");
			return tempString;
		} else {
			return "";
		}

	}
	
	
	/**
	 * 设置输出路径
	 * @param outputPath
	 */
	public void setOutputPath(String outputPath) {
		this.outputPath = outputPath;
		if (!outputPath.equals("")) {
			String realName = fileName.substring(fileName.lastIndexOf("/"),
					fileName.lastIndexOf("."));
			if (outputPath.charAt(outputPath.length()) == '/') {
				swfFile = new File(outputPath + realName + ".swf");
			} else {
				swfFile = new File(outputPath + realName + ".swf");
			}
		}
	}

}
