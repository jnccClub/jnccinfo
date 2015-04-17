var TableAdvanced = function() {

	var initTable = function(tblId,tblNameId,name,columns,data) {
		$('#'+tblNameId).html(name);	
		var oTable = $('#'+tblId).dataTable({
			"aoColumnDefs" : [ {
				"aTargets" : [ 0 ]
			} ],
			"aaSorting" : [ [ 1, 'asc' ] ],// 指定按多列数据排序的依据
			"aLengthMenu" : [ // 这个为选择每页的条目数，当使用一个二维数组时，二维层面只能有两个元素，
			[ 5, 10, 15, 20, -1 ], // 第一个为显示每页条目数的选项，第二个是关于这些选项的解释
			[ 5, 10, 15, 20, "All" ] // change per page values here
			],
			// set the initial value
			"iDisplayLength" : 10,
			/* Reduced data set */
			"aaData" : data,
			"aoColumns" :columns,
		});

		jQuery('#sample_2_wrapper .dataTables_filter input').addClass(
				"m-wrap small"); // modify table search input
		jQuery('#sample_2_wrapper .dataTables_length select').addClass(
				"m-wrap small"); // modify table per page dropdown
		jQuery('#sample_2_wrapper .dataTables_length select').select2(); // initialzie
																			// select2
																			// dropdown

		$('#sample_2_column_toggler input[type="checkbox"]').change(function() {
			/*
			 * Get the DataTables object again - this is not a recreation, just
			 * a get of the object
			 */
			var iCol = parseInt($(this).attr("data-column"));
			var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
			oTable.fnSetColumnVis(iCol, (bVis ? false : true));
		});
	}

	return {

		// main function to initiate the module
		/*tblId, 表单对应ID，用来更新数据
		 * tblNameId, 表头ID，底色为红色部分
		 * name, 表头ID对应内容
		 * columns,表单一共多少列，对应的列标题
		 * data   具体的数据
		 * */ 
		
		init : function(tblId,tblNameId,name,columns,data) {
			if (!jQuery().dataTable) {
				return;
			}
			initTable(tblId,tblNameId,name,columns,data);
		}

	};

}();