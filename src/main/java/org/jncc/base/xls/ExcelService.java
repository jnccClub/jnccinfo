package org.jncc.base.xls;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.jncc.base.course.ECourse;
import org.jncc.base.course.ECourseService;
import org.jncc.base.curriculum.ECurriculum;
import org.jncc.base.software.ESoftware;
import org.jncc.base.software.ESoftwareId;

public class ExcelService {

	public static void readExcel(String filename) {
		try {
			Workbook workbook = Workbook.getWorkbook(new File(
					"d:\\计算中心上机实验明细2011.xls"));
			Sheet sheet = workbook.getSheet(0);
			int row = sheet.getRows();
			int col = sheet.getColumns();
			System.out.println(row);
			System.out.println(col);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Vector<ESoftware> readExcel2ESWList(String filename){
		Vector<ESoftware> eswVec = new Vector();
        try {
            Workbook workbook = Workbook.getWorkbook(new File(filename)) ;
            Sheet sheet = workbook.getSheet(0); 
            int row = sheet.getRows();
            int col = sheet.getColumns();
            for(int i=1;i<row;i++)
            {
            	eswVec.add(cell2Esw(sheet.getRow(i)));
            }
            workbook.close(); 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return eswVec;
    }

	public static Vector<ECurriculum> readExcel2ECourse(String filename,ECourse ec){
		Vector<ECurriculum> ecurVec = new Vector();
        try {
            Workbook workbook = Workbook.getWorkbook(new File(filename)) ;
            Sheet sheet = workbook.getSheet(0); 
            ecurVec = ECourseService.genCourse(sheet, ec);
            workbook.close(); 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return ecurVec;
    }
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ExcelService a = new ExcelService();
		a.readExcel("");
	}

	public static ESoftware cell2Esw(Cell[] cells) {
		ESoftware esw = null;
		if (cells.length >= 6) {
			ESoftwareId id = new ESoftwareId(cells[0].getContents(),cells[1].getContents());
//			Date date = null;
//			try  
//			{  
//				DateFormat df = new SimpleDateFormat("yyyy-MM-dd "); 
//			    String tt = cells[2].getContents();
//			    Date d1 = df.parse("2000-01-01");  
//			    Date d2 = df.parse("1999-12-31");  
//			    date = df.parse(tt);
//			}  
//			catch (ParseException e)  
//			{  
//			    System.out.println(e.getMessage());
//			    date = new Date();
//			} 
			esw = new ESoftware(id,cells[2].getContents(),cells[3].getContents(),cells[4].getContents(),cells[5].getContents());
		}

		return esw;
	}
}
