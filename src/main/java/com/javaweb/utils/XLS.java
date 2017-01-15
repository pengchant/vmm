package com.javaweb.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;

 
/**
 * excel文档
 * 
 * @author PengChan
 *
 */
@SuppressWarnings("hiding")
public class XLS<T> {
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(XLS.class);
	
	// 类的类型
	private Class<T> classType;
 
	public XLS(Class<T> claz) {			 
		this.classType = claz;
	}
	
	/**
	 * 读取excel文档
	 * 
	 * @param xlsPath
	 * @return
	 */
	@SuppressWarnings({ "resource", "rawtypes" })
	public List<Map<String, Object>> readExcel(InputStream inputStream,String fileType) {
		List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
		try {
			// 根据制定的文件输入流导入excel而产生workbook对象		    
			Workbook workbook = (fileType.equals("xls"))?(new HSSFWorkbook(inputStream)):(new XSSFWorkbook(inputStream));
			// 获取到Excel文档中的第一个表单
			Sheet sheet = workbook.getSheetAt(0);
			// 对sheet中的每一行进行迭代
			for (Row r : sheet) {
				if (r.getRowNum() < 2) {
					continue;
				}
				// 开始处理数据
				T instance = this.getClassType();
				Map<String, Object> elements = new HashMap<>();
				// 把读取到的数据放到类中
				Field[] declaredFields = instance.getClass().getDeclaredFields();
				for (int i = 0; i < declaredFields.length; i++) {
					Field f = declaredFields[i];
					logger.info(f.getName());
					// 设置可以访问
					f.setAccessible(true);
					r.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
					// 对不同类型的数据进行判断
					Class fieldType = f.getType();
					String cellValue = r.getCell(i).getStringCellValue();
					logger.info("字段的类型："+fieldType+",字段的值："+cellValue);					
					elements.put(f.getName(), cellValue); 				
				}
				results.add(elements);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return results;
	}

	/**
	 * 导出excel文档
	 * 
	 * @param path
	 *            文件的路径
	 * @param fileName
	 *            文件的名称
	 * @param title
	 *            文件的标题
	 * @param headers
	 *            文件的头部
	 * @param data
	 *            具体的数据
	 * @return
	 */
	public HSSFWorkbook writeExcel(String title, String[] headers, List<T> data,MyXLSStyle myXLSStyle) {
		// 创建HSSFWrokbook对象
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 建立新的sheet对象
		HSSFSheet sheet = workbook.createSheet();
		// 在sheet中创建第一行
		HSSFRow row1 = sheet.createRow(0);		
		// 创建单元格
		HSSFCell cell = row1.createCell(0);
		// 设置单元格内容
		cell.setCellValue(title);
		// 设置标题的样式
		if(myXLSStyle!=null&&myXLSStyle.getHeaderStyle(workbook)!=null){
			cell.setCellStyle(myXLSStyle.getHeaderStyle(workbook));
		}
		// 合并单元格
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headers.length-1));
		// 设置列宽
		if(myXLSStyle!=null&&myXLSStyle.getColumnWidth()!=null&&myXLSStyle.getColumnWidth().length>0){
			int[] columnwidth = myXLSStyle.getColumnWidth();
			for(int m= 0;m<columnwidth.length;m++){
				// 设置样式
				sheet.setColumnWidth(m, columnwidth[m]);
			}
		}
		// 下面开始创建具体的内容
		// 创建标题
		HSSFRow row2 = sheet.createRow(1);
		HSSFCellStyle titleStyle = myXLSStyle.getTitleStyle(workbook);
		for (int i = 0; i < headers.length; i++) {
			Cell titleCell = row2.createCell(i);
			titleCell.setCellValue(headers[i]);
			// 设置表格标题的样式
			if(titleStyle!=null){
				titleCell.setCellStyle(titleStyle);
			}
		}
		// 创建内容
		for (int j = 2; j < data.size() + 2; j++) {
			HSSFRow row = sheet.createRow(j);
			// 设置具体内容
			T instance = data.get(j - 2);
			// 把读取到的数据放到类中
			Field[] declaredFields = instance.getClass().getDeclaredFields();
			for (int t = 0; t < declaredFields.length; t++) {
				Field f = declaredFields[t];
				// 设置可以访问
				f.setAccessible(true);
				try {					 
					Cell content = row.createCell(t);
					content.setCellValue(f.get(instance) + "");
					// 设置内容单元格的样式
					if(myXLSStyle.getContentStyle(workbook)!=null){
						content.setCellStyle(myXLSStyle.getContentStyle(workbook));
					}
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return workbook;
	}
	
	/**
	 * 输出到前台
	 * @param response
	 * @param fileName
	 * @param contentType
	 * @param workbook
	 */
	public void printStream(HttpServletResponse response,String fileName,HSSFWorkbook workbook){
		try {
			OutputStream outputStream = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="+new String(fileName.getBytes("GBK"),"iso-8859-1"));
			response.setContentType("application/msexcel");
			workbook.write(outputStream);
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过反射获取类的实例化对象
	 * @return
	 */
	public T getClassType() {
		try {
			return classType.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}	
	
	/**
	 * 内部接口设置样式
	 * @author cp
	 *
	 */
	public interface MyXLSStyle{
		/**
		 * 设置excel表格标题的样式
		 */
		public HSSFCellStyle getHeaderStyle(HSSFWorkbook workbook);
		
		/**
		 * 设置属性字段样式
		 */
		public HSSFCellStyle getTitleStyle(HSSFWorkbook workbook);
		
		/**
		 * 设置列宽
		 */
		public int[] getColumnWidth();
		
		/**
		 * 设置内容单元格的样式
		 */
		public HSSFCellStyle getContentStyle(HSSFWorkbook workbook);
	};
	
	/**
	 * 默认的样式
	 */
	public class CommonExcelStyle implements MyXLSStyle{
		
		public CommonExcelStyle(int count) {
			this.count = count;
		}

		private int count;
 
		
		public int getCount() {
			return count;
		}
 
		public void setCount(int count) {
			this.count = count;
		}

		/**
		 * 设置头部的样式
		 */		 
		@SuppressWarnings("deprecation")
		@Override
		public HSSFCellStyle getHeaderStyle(HSSFWorkbook workbook) {			 
			HSSFCellStyle style = workbook.createCellStyle();
			// 设置居中对齐
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			// 设置字体
			HSSFFont font = workbook.createFont();
			// 设置背景颜色
			style.setFillForegroundColor(HSSFColor.GREEN.index);
			style.setFillBackgroundColor(HSSFColor.GREEN.index);
			font.setFontName("黑体");
			font.setFontHeightInPoints((short)16);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			style.setFont(font);			 
			return style;
		}

 
		@Override
		public HSSFCellStyle getTitleStyle(HSSFWorkbook workbook) {			 			
			HSSFCellStyle style = workbook.createCellStyle();
			// 设置居中对齐
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			// 设置字体
			HSSFFont font = workbook.createFont();
			font.setFontName("仿宋_GB2312");
			font.setFontHeightInPoints((short)12);			 
			style.setFont(font);				 
			return style;
		}

		@Override
		public int[] getColumnWidth() {	
			int[] counter = new int[this.count];
			for(int i = 0;i<this.count;i++){
				counter[i] = 4000;
			}
			return counter;
		}

		@Override
		public HSSFCellStyle getContentStyle(HSSFWorkbook workbook) {		 
			HSSFCellStyle style = workbook.createCellStyle();
			// 设置居中对齐
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			// 设置字体
			HSSFFont font = workbook.createFont();
			font.setFontName("仿宋_GB2312");
			font.setFontHeightInPoints((short)10);		 
			style.setFont(font);				 
			return style;
		}
		
	};
	
	
	/**
	 * 获取默认的样式
	 * @param count
	 * @return
	 */
	public MyXLSStyle getCommonStyle(int count){
		return new CommonExcelStyle(count);
	}

}
