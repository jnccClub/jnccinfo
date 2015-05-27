var TableEditable = function() {
	return {
		// main function to initiate the module
		init : function(tblId, data, columns) {
			function restoreRow(oTable, nRow) {
				var aData = oTable.fnGetData(nRow);
				var jqTds = $('>td', nRow);

				for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
					oTable.fnUpdate(aData[i], nRow, i, false);
				}

				oTable.fnDraw();
			}

			function editRow(oTable, nRow) {
				var aData = oTable.fnGetData(nRow);
				var jqTds = $('>td', nRow);
				jqTds[0].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[0] + '">';
				jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[1] + '">';
				jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[2] + '">';
				jqTds[3].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[3] + '">';
				jqTds[4].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[4] + '">';
				jqTds[5].innerHTML = '<input type="text" class="m-wrap small" value="'
						+ aData[5] + '">';
				jqTds[6].innerHTML = '<a class="edit" href="">保存</a>';
				jqTds[7].innerHTML = '<a class="cancel" href="">取消</a>';
			}

			function saveRow(oTable, nRow) {
				var jqInputs = $('input', nRow);
				oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
				oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
				oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
				oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
				oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
				oTable.fnUpdate(jqInputs[5].value, nRow, 5, false);
				oTable.fnUpdate('<a class="edit" href="">编辑</a>', nRow, 6,
						false);
				oTable.fnUpdate('<a class="delete" href="">删除</a>', nRow, 7,
						false);
				oTable.fnDraw();
			}

			function cancelEditRow(oTable, nRow) {
				var jqInputs = $('input', nRow);
				oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
				oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
				oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
				oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
				oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 4,
						false);
				oTable.fnDraw();
			}

			var oTable = $('#' + tblId)
					.dataTable(
							{
								"aLengthMenu" : [ [ 5, 10, 15, 20, -1 ],
										[ 5, 10, 15, 20, "All" ] // change
								// per page
								// values
								// here
								],
								// set the initial value
								"iDisplayLength" : 10,
								"sDom" : "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
								"sPaginationType" : "bootstrap",
								"oLanguage" : {
									"sLengthMenu" : "每页 _MENU_ 条",
									"oPaginate" : {
										"sPrevious" : "前一页",
										"sNext" : "后一页"
									}
								},
								"aoColumnDefs" : [ {
									'bSortable' : true,
									'aTargets' : [ 0 ]
								} ],
								"aaData" : data,
								"aoColumns" : columns
							});

			var nEditing = null;
			$('#sample_editable_1_new')
					.click(
							function(e) {
								e.preventDefault();
								var aiNew = oTable
										.fnAddData([
												'',
												'',
												'',
												'',
												'',
												'',
												'<a class="edit" href="javascript:;">编辑</a>',
												'<a class="delete" href="javascript:;" data-mode="new">删除</a>' ]);
								var nRow = oTable.fnGetNodes(aiNew[0]);
								editRow(oTable, nRow);
								nEditing = nRow;
							});

			$('#' + tblId + ' a.delete').live('click', function(e) {
				e.preventDefault();

				if (confirm("Are you sure to delete this row ?") == false) {
					return;
				}

				var nRow = $(this).parents('tr')[0];
				tableRowOperation("DELETE", nRow, oTable);
				oTable.fnDeleteRow(nRow);
			});

			$('#' + tblId + ' a.cancel').live('click', function(e) {
				e.preventDefault();
				if ($(this).attr("data-mode") == "new") {
					var nRow = $(this).parents('tr')[0];
					oTable.fnDeleteRow(nRow);
				} else {
					restoreRow(oTable, nEditing);
					nEditing = null;
				}
			});

			$('#' + tblId + ' a.edit').live('click', function(e) {
				e.preventDefault();

				/* Get the row as a parent of the link that was clicked on */
				var nRow = $(this).parents('tr')[0];

				if (nEditing !== null && nEditing != nRow) {
					/*
					 * Currently editing - but not this row - restore the old
					 * before continuing to edit mode
					 */
					restoreRow(oTable, nEditing);
					editRow(oTable, nRow);
					nEditing = nRow;
				} else if (nEditing == nRow && this.innerHTML == "保存") {
					/* Editing this row and want to save it */
					saveRow(oTable, nEditing);
					tableRowOperation("SAVE", nRow, oTable); //需要先保存否则无法获取修改后信息
					nEditing = null;
				} else {
					/* No edit in progress - let's start one */
					editRow(oTable, nRow);
					nEditing = nRow;
				}
			});
		}
	};

	function tableRowOperation(cmdType, nRow, oTable) {
		var aData = oTable.fnGetData(nRow);
		var params = [ {
			name : "userInfo.username",
			value : aData[0]
		}, {
			name : "userInfo.realname",
			value : aData[1]
		}, {
			name : "userInfo.password",
			value : aData[2]
		}, {
			name : "userInfo.phoneno",
			value : aData[3]
		}, {
			name : "userInfo.email",
			value : aData[4]
		}, {
			name : "userInfo.selfIntroduce",
			value : aData[5]
		}, {
			name : "userInfo.preference",
			value : cmdType
		} ];
		$.ajax({
			url : 'comAction/user_modUserInfo.action',
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data, status) {
				if (status == "success") {
					alert("恭喜,修改/删除 成功!")
				}
			},
			error : function(data, status, e) {
				alert(e);
			},
			complete : function() {
			}
		});

	}

}();
