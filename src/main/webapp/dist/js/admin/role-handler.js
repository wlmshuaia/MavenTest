/**
 * 操作类
 */
var Handler = {
	/**
	 * 是否删除
	 */
	fIfDelete: function(event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		// recipient: id-handle => 1-delete, 2-edit, 3-add, 
		var recipient = button.data('whatever'); // Extract info from data-* attributes
		
		// 模态框
		var modal = $(this);
		
		// 设置在 data-whatever 的数据
		if(recipient == undefined) { // 自动调用函数？
			return false;
		}
		var aVal = recipient.split("-");
		if("delete" == aVal[1]) {
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			modal.find('.modal-title').text("提示");
			var sHtml = '确定删除？<input type="hidden" name="id" value="'+aVal[0]+'">' ;
			modal.find('.modal-body p').html(sHtml);
			
			modal.find('.modal-body p').show();
			modal.find('.modal-body form').hide();
			modal.find(".modal-body").find("#editAssign").hide();
			
			modal.find(".btnConfirm").bind("click", {url: 'admin/Role/deleteRole.do'}, CommonHandler.fToDelete);
		} else if("edit" == aVal[1]) {
			modal.find(".modal-title").text("编辑");
			
			var oForm = modal.find('.modal-body form').eq(0);
			
			var Role = CommonHandler.fGetUserInfo(aVal[0], 'admin/Role/getRoleById.do');
			
			oForm.find("input[name=id]").val(Role.id);
			oForm.find("input[name=name]").val(Role.name);
			oForm.find("input[name=remark]").val(Role.remark);
			oForm.find("input[name=isOpen][value="+Role.isOpen+"]").prop("checked", true);
			
			oForm.show();
			modal.find('.modal-body p').hide();
			modal.find(".modal-body").find("#editAssign").hide();
			modal.find(".btnConfirm").bind("click", {url: 'admin/Role/saveRole.do'}, CommonHandler.fToEdit);
		} else if("add" == aVal[1]) { // 增加节点
			modal.find(".modal-body input").val("");
			
			var oForm = modal.find(".modal-body form").eq(0);
			oForm.find("input[name=pid]").val(aVal[0]);
			
			modal.find('.modal-body p').hide();
			modal.find(".modal-body").find("#editAssign").hide();
			modal.find('.modal-body form').show();
			modal.find(".btnConfirm").bind("click", {url: 'admin/Role/addRole.do'}, CommonHandler.fToAdd);
		} else if("assign" == aVal[1]) { // 分配权限
			modal.find(".modal-body p").hide();
			modal.find(".modal-body form").hide();
			modal.find(".modal-body").find("#editAssign").show();
			
			// 获取所有节点
			var nodes = Handler.fGetAllNodes() ;
			
			// 节点选项
			var nHtml = '';
			
			// 将节点信息填充
			$.each(nodes, function(one, oneChild){
//				console.log(one);
				nHtml += '<div class="panel panel-default">'+
				'<div class="panel-heading">'
				nHtml += '<label><input type="checkbox" name="assign[]" onclick="Handler.fChooseOne(this)">'+one+'</label></div>'; // 一级分类
				
				if(oneChild.child.length != 0) {
					nHtml += '<div class="panel-body">';
					
					$.each(oneChild.child, function(two, twoChild){
//						console.log(two);
						
						nHtml += '<div class="panel panel-default">'+
						'<div class="panel-heading">';
						nHtml += '<label><input type="checkbox" name="assign[]" onclick="Handler.fChooseOne(this)">'+two+'</label></div>'; // 二级分类
						
						if(twoChild.child.length != 0) {
							nHtml += '<div class="panel-body">';
								nHtml += '<ul class="list-group ul-inline">';
								$.each(twoChild.child, function(n, node){
//									console.log(node.remark);
									nHtml += '<li class="list-group-item">';
										nHtml += '<label><input type="checkbox" name="assign[]" onclick="Handler.fChooseOne(this)">'+node.remark+'</label>';	// 三级分类
									nHtml += '</li>';
								});
								nHtml += '</ul>';
							nHtml += '</div>';// 二级分类 body
						}
						nHtml += '</div>'; // 二级分类 container
					});
					nHtml += '</div>'; // 一级分类 body
				}
				nHtml += '</div>'; // 一级分类 container
			});
			
			modal.find(".modal-body").find("#editAssign").html(nHtml);
		}
	},
	/**
	 * 获取所有权限
	 */
	fGetAllNodes: function() {
		var nodes = null;
		$.ajax({
			url: 'admin/Node/selectAllJson.do',
			method: 'get',
			dataType: 'json',
			async: false,
			success: function(data) {
				nodes = data;
			},
			error: function(data) {
				console.log("fGetAllNodes error...");
			}
		});
		return nodes;
	},
	/**
	 * 选中一个节点选项后查看是否满足全选
	 * @param obj
	 */
	fChooseOne: function(obj) {
//		var oParent = ;
		var aSibs = $(obj).parents(".panel-body").find(".panel-default");
		var aChild = $(obj).parents(".panel-heading").siblings(".panel-body").find("input");
		
//		console.log(aSibs.length +", "+ aChild.length);
		if($(obj).val() == "on") {
			aChild.prop("checked", true);
		} else {
			aChild.prop("checked", false);
		}
		
	},
};

