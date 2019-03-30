package com.boreum.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boreum.service.UserService;
import com.boreum.service.domain.Miform;
import com.boreum.service.domain.User;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Controller
@RequestMapping("/miform/*")
public class MiplatformController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping( value="/insert", method=RequestMethod.POST)
	public void insert(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("오긴옴");
		
		DatasetList out_dl = new DatasetList();
		VariableList out_vl = new VariableList();
		
		request.getCharacterEncoding();
		
		String testinsp = request.getParameter("testinsp");
		String testfiled = request.getParameter("testfiled");
		String fiedcode = request.getParameter("fiedcode");
		String formattype = request.getParameter("formattype");
		String coltype = request.getParameter("coltype");
		String colcode = request.getParameter("colcode");
		
		Miform miform = new Miform();
		miform.setTestinsp(testinsp);
		miform.setTestfiled(testfiled);
		miform.setFiledcode(fiedcode);
		miform.setFormattype(formattype);
		miform.setColtype(coltype);
		miform.setColcode(colcode);
		
		System.out.println(miform);
		
		userService.insertMi(miform);
		
		List<Miform> list = userService.listMi();
		
		
		System.out.println(list);
		
		Dataset dataset = new Dataset("ds");
		
		dataset.addColumn("TESTINSP",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("TESTFILED",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("FILEDCODE",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("FORMATTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("COLTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("COLCODE",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("DISPLYORDER",ColumnInfo.CY_COLINFO_STRING, 20);
		for(int i = 0; i<list.size(); i++) {
			
			int row = dataset.appendRow();
			dataset.setColumn(row, "TESTINSP", list.get(i).getTestinsp());
			dataset.setColumn(row, "TESTFILED", list.get(i).getTestfiled());
			dataset.setColumn(row, "FILEDCODE", list.get(i).getFiledcode());
			dataset.setColumn(row, "FORMATTYPE", list.get(i).getFormattype());
			dataset.setColumn(row, "COLTYPE", list.get(i).getColtype());
			dataset.setColumn(row, "COLCODE", list.get(i).getColcode());
			dataset.setColumn(row, "DISPLYORDER", list.get(i).getDisplyorder());
			
			out_dl.addDataset(dataset);
			
		}
		
		System.out.println(dataset);
		
		
		PlatformResponse platformResponse = new PlatformResponse(response, PlatformRequest.XML,"utf-8");
		platformResponse.sendData(out_vl, out_dl);
		
		System.out.println("끝");
	}
	
	@RequestMapping( value = "/search", method=RequestMethod.POST)
	public void search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("miform/search");

		Miform miform = new Miform();
		
		DatasetList out_dl = new DatasetList();
		VariableList out_vl = new VariableList();
		

		
		if(request.getParameter("keyword") != "" && request.getParameter("keyword") != null) {
			System.out.println("키워드 받음");
			String keyword = request.getParameter("keyword");
			String condition = request.getParameter("condition");
			
			System.out.println(keyword);
			System.out.println(condition);
			
			
			miform.setKeyword(keyword);
			miform.setCondition(condition);
			
			System.out.println(miform);
			
			List<Miform> list = userService.listMis(miform);
			
			System.out.println(list);
			
			Dataset dataset = new Dataset("ds");
			
			dataset.addColumn("TESTINSP",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("TESTFILED",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("FILEDCODE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("FORMATTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("COLTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("COLCODE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("DISPLYORDER",ColumnInfo.CY_COLINFO_STRING, 20);
			
			for(int i = 0; i<list.size(); i++) {
				
				int row = dataset.appendRow();
				dataset.setColumn(row, "TESTINSP", list.get(i).getTestinsp());
				dataset.setColumn(row, "TESTFILED", list.get(i).getTestfiled());
				dataset.setColumn(row, "FILEDCODE", list.get(i).getFiledcode());
				dataset.setColumn(row, "FORMATTYPE", list.get(i).getFormattype());
				dataset.setColumn(row, "COLTYPE", list.get(i).getColtype());
				dataset.setColumn(row, "COLCODE", list.get(i).getColcode());
				dataset.setColumn(row, "DISPLYORDER", list.get(i).getDisplyorder());
				
				out_dl.addDataset(dataset);
				
			}
			
			System.out.println(dataset);
			
			
			PlatformResponse platformResponse = new PlatformResponse(response, PlatformRequest.XML,"utf-8");
			platformResponse.sendData(out_vl, out_dl);
		
		}else {
		/*
			List<Miform> list = userService.listMi();
		
		
			System.out.println(list);
			
			Dataset dataset = new Dataset("ds");
			
			dataset.addColumn("TESTINSP",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("TESTFILED",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("FILEDCODE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("FORMATTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("COLTYPE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("COLCODE",ColumnInfo.CY_COLINFO_STRING, 20);
			dataset.addColumn("DISPLYORDER",ColumnInfo.CY_COLINFO_STRING, 20);
			for(int i = 0; i<list.size(); i++) {
				
				int row = dataset.appendRow();
				dataset.setColumn(row, "TESTINSP", list.get(i).getTestinsp());
				dataset.setColumn(row, "TESTFILED", list.get(i).getTestfiled());
				dataset.setColumn(row, "FILEDCODE", list.get(i).getFiledcode());
				dataset.setColumn(row, "FORMATTYPE", list.get(i).getFormattype());
				dataset.setColumn(row, "COLTYPE", list.get(i).getColtype());
				dataset.setColumn(row, "COLCODE", list.get(i).getColcode());
				dataset.setColumn(row, "DISPLYORDER", list.get(i).getDisplyorder());
				
				out_dl.addDataset(dataset);
				
			}
			
			System.out.println(dataset);
			
			*/
			
			out_vl.addStr("ErrorCode", "0");
			out_vl.addStr("ErrorMsg", "SUCC");
			out_vl.addStr("out_var", "tlsqhfma");
			
			System.out.println(out_vl);
			PlatformResponse platformResponse = new PlatformResponse(response, PlatformRequest.XML,"utf-8");
			platformResponse.sendData(out_vl, out_dl);
		
			
		}
	}
	
	@RequestMapping( value = "/delete", method=RequestMethod.POST)
	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dpval = request.getParameter("dpval");
		System.out.println(dpval);
		
		userService.deleteMi(dpval);
		
		System.out.println("끝");
		
	}
	
	@RequestMapping( value = "/updateMi", method=RequestMethod.POST)
	public void updateMi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/miform/update :: start");
		
		Miform miform = new Miform();
		
		String changedId = request.getParameter("changId");
		String changedVal = request.getParameter("changVal");
		
		System.out.println(changedId);
		System.out.println(changedVal);
		
		if( changedId.equals("COLTYPE")) {
			miform.setColtype(changedVal);
		} else if (changedId.equals("COLCODE")) {
			miform.setColcode(changedVal);
		} else if (changedId.equals("DISPLYORDER")) {
			System.out.println("안찍냐고");
			miform.setDisplyorder(changedVal);
		}
		
		System.out.println(miform);
		
		userService.updateMi(miform);
		
		System.out.println("끝");
	
		
	}
	
	@RequestMapping( value = "/test", method=RequestMethod.POST)
	public void test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/****** Service API 초기화 ******/
		/** Input 부분 초기화 **/
		VariableList in_vl = new VariableList();
		DatasetList  in_dl = new DatasetList();
		PlatformRequest pReq = new PlatformRequest(request, "utf-8");

		/** Web Server에서 XML수신 및 Parsing **/
		pReq.receiveData();

		/** List 획득 및 Dataset, 변수 획득 **/
		in_vl = pReq.getVariableList();
		in_dl = pReq.getDatasetList();
		Dataset ds = in_dl.getDataset("input");
		
		System.out.println(ds);
		
		/*
		String in_var1 = request.getParameter("in_var1");
		String in_var2 = in_vl.getValueAsString("in_var2");

		*//** Output 부분 초기화 **//*
		VariableList out_vl = new VariableList();
		DatasetList  out_dl = new DatasetList();

		*//******* JDBC Connection *******//*
		Connection conn = null;
		Statement  stmt = null; 
		ResultSet  rs   = null; 

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=EDU","edu","edu");
		stmt = conn.createStatement();

		String SQL = "";
		int	i;
		try {
		*//******** Dataset을 INSERT, UPDATE처리 ********//*
		for(i=0;i<ds.getRowCount();i++)
		{
			String row_status = ds.getRowStatus(i);
			if( row_status.equals("insert") == true )
			{
				SQL = "insert into base_sawon_U ( name, sabun, dept, jikgup, gender, ipsa_date, marry, email, smemo ) values ( " +
						"'" + dsGet(ds,i,"name") + "'," + 
						"'" + dsGet(ds,i,"sabun") + "'," + 
						"'" + dsGet(ds,i,"dept") + "'," +  
						"'" + dsGet(ds,i,"jikgup") + "'," +
						"'" + dsGet(ds,i,"gender") + "'," +
						"'" + dsGet(ds,i,"ipsa_date") + "'," +
						"'" + dsGet(ds,i,"marry") + "'," +
						"'" + dsGet(ds,i,"email") + "'," +				
						"'" + dsGet(ds,i,"smemo") + "' )";
			}
			else if( row_status.equals("update") == true )
			{
				String org_name = ds.getOrgColumn(i,"name").getString(); 
				SQL = "update base_sawon_U set " +
						"name = '" + dsGet(ds,i,"name") + "'," + 
						"sabun = '" + dsGet(ds,i,"sabun") + "'," +
						"dept = '" + dsGet(ds,i,"dept") + "'," +  
						"jikgup = '" + dsGet(ds,i,"jikgup") + "'," +
						"gender = '" + dsGet(ds,i,"gender") + "'," +
						"ipsa_date = '" + dsGet(ds,i,"ipsa_date") + "'," +
						"marry = '" + dsGet(ds,i,"marry") + "'," +
						"email = '" + dsGet(ds,i,"email") + "'," +
						"smemo = '" + dsGet(ds,i,"smemo") + "' " +
						"where " +
						"name = " + "'" + org_name + "'";
			}
			stmt.executeUpdate(SQL);
		}
		*//****** Dataset을 DELETE처리 ****//*
		for( i = 0 ; i< ds.getDeleteRowCount() ; i++ )
		{
			String name = ds.getDeleteColumn(i,"name").getString();
			
			if( name == null )
			{
				name= "";
			}
			
			SQL = "delete from base_sawon_U where " +
					"name = " + "'" + name + "'";
			stmt.executeUpdate(SQL);
		}


		*//********* 변수를 VariableList에 추가 ************//*
		out_vl.addStr("ErrorCode", "0");
		out_vl.addStr("ErrorMsg", "SUCC");
		out_vl.addStr("out_var", in_var2);
		}
		catch ( SQLException e ) {
		out_vl.addStr("ErrorCode", "-1");
		out_vl.addStr("ErrorMsg", e.getMessage());
		out_vl.addStr("out_var", in_var2);
		}

		*//******** JDBC Close ********//*
		if ( stmt != null ) try { stmt.close(); } catch (Exception e) {}
		if ( conn != null ) try { conn.close(); } catch (Exception e) {}

		*//******** 결과 XML 생성 및 Web Server로 전달 ******//*
		out.clearBuffer();
		PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.XML, "utf-8");
		pRes.sendData(out_vl, out_dl);

*/
	}

	public String  dsGet(Dataset ds, int rowno, String id) throws Exception
	{
		String value;
		value = ds.getColumn(rowno,id).getString();
		if( value == null )
			return "";
		else
			return value;
	} 
}
