package org.jncc.base.file;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import org.jncc.base.course.ECourse;
import org.jncc.base.curriculum.ECurriculum;
import org.jncc.base.curriculum.ECurriculumId;
import org.jncc.persistence.UtilTool;
import org.jncc.persistence.dbSession;

public class comCourseUpload {

	@SuppressWarnings("resource")
	public static Vector<ECurriculum> readCab2ECourse(String filename,
			ECourse ec) {
		Vector<ECurriculum> ecurVec = new Vector();
		File file = new File(filename);
		BufferedReader reader = null;
		String classNo = "";
		try {
			System.out.println("以行为单位读取文件内容，一次读一整行：");
			// reader = new BufferedReader(new FileReader(file));
			InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "GB2312");
			reader = new BufferedReader(isr);
			String tempString = null;
			int line = 0;
			String course_Info = reader.readLine();
			if (course_Info != null) {
				String[] cInfos = course_Info.split(",");
				if (cInfos.length > 7) {
					String courseName = cInfos[4];
					String courseNo = cInfos[0];
					String teacherName = cInfos[1];
					String teacherNo = cInfos[2];
					classNo = cInfos[3];
					ec.setName(courseName);
					ec.setSerial(courseNo);
					ec.setTeacher(teacherName);
					ec.setTeacherNo(teacherNo);
					ec.setClassNo(classNo);
				}
			}
			// 一次读入一行，直到读入null为文件结束
			Set<String> classNOset = new HashSet<String>();
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				System.out.println("line " + line + ": " + tempString);
				line++;
				ecurVec.add(getStuInfo(tempString, ec.getSerial(), classNOset));
			}
			ec.setSeats(line);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
		return ecurVec;
	}

	public static ECurriculum getStuInfo(String stuStr, String serial,
			Set<String> classNOset) {
		String[] stuInfos = stuStr.split(",");
		if (stuInfos.length >= 2) {
			String stuNo = stuInfos[0];
			if (stuNo == null || stuNo.trim().equals("")) {
				return null;
			}
			ECurriculumId id = new ECurriculumId(serial, stuNo);
			String classNo = "";
			if (stuNo.length() >= 7) {
				classNo = stuNo.substring(0, 7);
				classNo = classNo.trim();
				if (UtilTool.IsValid(classNo)) {
					classNOset.add(classNo);
				}
			}
			ECurriculum ecur = new ECurriculum(id, stuInfos[1], classNo, "");
			return ecur;
		} else {
			return null;
		}

	}

	public static void addCourse(String filename, ECourse ec) {
		Vector<ECurriculum> ecurVec = comCourseUpload.readCab2ECourse(filename,
				ec);
		try {
			dbSession.init();
			dbSession.replaceInsert(ec);
			dbSession.flush();
			for (int i = 0; i < ecurVec.size(); i++) {
				dbSession.replaceInsert(ecurVec.get(i));
				if (i % 50 == 1) {
					dbSession.flush();
				}
			}
			dbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void addAllCourse(String filePath) {
		File root = new File(filePath);
		File[] files = root.listFiles();
		int fileCount = 0;
		for (File file : files) {
			
			if (file.isDirectory()) {
				/*
				 * 递归调用
				 */
				// getFiles(file.getAbsolutePath());
				// filelist.add(file.getAbsolutePath());
				System.out.println("显示" + filePath + "下所有子目录及其文件"
						+ file.getAbsolutePath());
			} else {
				System.out.println("显示" + filePath + "下所有子目录"
						+ file.getAbsolutePath());
				String filename = file.getAbsolutePath();
				ECourse ec = new ECourse();
				addCourse(filename, ec);
				fileCount ++;
			}
		}
		System.out.println("完成所有"+fileCount+"个文件数据插入");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String path = "E:\\work\\nameList201503";

		addAllCourse(path);

	}

}
