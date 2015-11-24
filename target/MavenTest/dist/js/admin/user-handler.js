
$(function() {
	// 弹出模态框
	$('#myModal').on('show.bs.modal', Handler.fIfDelete);
});

/**
 * 操作类
 */
var Handler = {
	/**
	 * 是否删除
	 */
	fIfDelete: function(event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		var recipient = button.data('whatever'); // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this);
		modal.find('.modal-title').text("提示");
		var sHtml = '确定删除？<input type="hidden" name="id" value="'+recipient+'">' ;
		modal.find('.modal-body').html(sHtml);
		
		modal.find(".btnConfirm").bind("click", Handler.fToHandle);
	},
	/**
	 * 点击确定删除
	 * @param obj
	 */
	fToHandle: function() {
		var id = $(".modal-footer").siblings(".modal-body").find("input[name=id]").val();
//		console.log("666: "+id);
		$.ajax({
			url: 'aUser/deleteUser.do',
			method: 'get',
			dataType: 'json',
			data: {id: id},
			success: function(data) {
				console.log("delete result: "+data);
				var modal = $(this);
				modal.find('.modal-title').text("提示");
				var sHtml = '删除成功！' ;
				modal.find('.modal-body').html(sHtml);
				
				$("#myModal").modal('toggle');
			},
			error: function(data) {
				console.log("deleteUser error...");
			}
		});
	},
	
}


