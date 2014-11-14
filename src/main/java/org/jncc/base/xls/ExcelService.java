package org.jncc.base.xls;

import java.io.File;

import jxl.Sheet;
import jxl.Workbook;

public class ExcelService {
	
	public void readExcel(){
        try {
            Workbook workbook = Workbook.getWorkbook(new File("d:\\计算中心上机实验明细2011.xls")) ;
            Sheet sheet = workbook.getSheet(0); 
            int row = sheet.getRows() ;
            int col = sheet.getColumns() ;
            System.out.println(row) ;
            System.out.println(col) ;
            workbook.close(); 
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ExcelService a =new ExcelService();
		a.readExcel();
	}

}
