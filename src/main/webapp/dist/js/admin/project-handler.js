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
			
			modal.find(".btnConfirm").bind("click", {url: 'admin/Project/deleteProject.do'}, CommonHandler.fToDelete);
		} else if("edit" == aVal[1]) {
			modal.find(".modal-title").text("编辑");
			
			var oForm = modal.find('.modal-body form').eq(0);
			
			var project = CommonHandler.fGetUserInfo(aVal[0], 'admin/Project/getProjectById.do');
			
			oForm.find("input[name=id]").val(project.id);
			oForm.find("input[name=name]").val(project.name);
			oForm.find("input[name=sex][value="+project.sex+"]").attr("checked", "checked");
			oForm.find("input[name=price]").val(project.price);
			oForm.find("textarea[name=description]").val(project.description);
			
			oForm.show();
			modal.find('.modal-body p').hide();
			modal.find(".btnConfirm").bind("click", {url: 'admin/Project/saveProject.do'}, CommonHandler.fToEdit);
		} else if("add" == aVal[1]) { // 增加用户
			modal.find(".modal-body input").val("");
			modal.find(".modal-body input[name=sex]").eq(0).prop("checked", true);
			modal.find(".modal-body textarea").val("");
			
			modal.find('.modal-body p').hide();
			modal.find('.modal-body form').show();
			modal.find(".btnConfirm").bind("click", {url: 'admin/Project/addProject.do'}, CommonHandler.fToAdd);
		}
	},
};




