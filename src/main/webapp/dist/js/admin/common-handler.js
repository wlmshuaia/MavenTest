
$(function() {
	// 点击删除模态框时间绑定
	$('#ifHandle').on('show.bs.modal', Handler.fIfDelete);
	// 编辑信息模态框属性设置
	$('#ifHandle').modal({
		backdrop: 'static', // 防止 点击空白 模态框消失
		keyboard: false,	// 防止 esc 键 模态框消失
		show: false
	});
	
	// 操作完成提示
	$('#handleSuccess').modal({
		backdrop: 'static',
		keyboard: false,
		show: false
	});
	
	$("#chooseAll").bind("click", {id: "#chooseAll", table: ".table"}, Choose.fChooseAll);
});

/**
 * 全选工具类
 */
var Choose = {
	/**
	 * 全选
	 */
	fChooseAll: function(e) {
		var oChAll = $(e.data.id);
		var aChBox = $(e.data.table).find("tbody input[type=checkbox]") ;
//		console.log($(oChAll).is(":checked"));
		
		if(true == $(oChAll).is(":checked")) { // 全选
			$(aChBox).prop("checked", true);
		} else { // 全不选
			$(aChBox).prop("checked", false);
		}
	},
};

/**
 * 通用操作类
 */
var CommonHandler = {
	/**
	 * 是否增加
	 * @param url
	 */
	fIfAdd: function(url) {
		
	},
	/**
	 * 是否删除
	 * @param url
	 */
	fIfDelete: function(url) {
		
	},
	/**
	 * 是否编辑
	 * @param url
	 */
	fIfEdit: function(url) {
		
	},
	/**
	 * 获取用户信息
	 */
	fGetUserInfo: function(id, url) {
		var sUserInfo = "";
		$.ajax({
			url: url,
			method: 'get',
			data: {id: id},
			async: false,
			dataType: 'json',
			success: function(data) {
				sUserInfo = data;
			},
			error: function(data) {
				console.log("getUserInfo error...");
			}
		});
		return sUserInfo ;
	},
	/**
	 * 增加用户
	 */
	fToAdd: function(e) {
		var sForm = CommonHandler.fGetFormSerializable($("#editUserForm"));
		$.ajax({
			url: e.data.url,
			method: 'post',
			data: JSON.stringify(sForm),
			dataType: 'json',
			contentType: 'application/json',
			success: function(data) {
				CommonHandler.fHandleSuccess("", "添加成功！");
			},
			error: function(data) {
				console.log("save Object error...");
			}
		});
	},
	/**
	 * 点击确定删除
	 * @param obj
	 */
	fToDelete: function(e) {
		var id = $(".modal-footer").siblings(".modal-body").find("input[name=id]").val();
		$.ajax({
			url: e.data.url,
			method: 'get',
			dataType: 'json',
			data: {id: id},
			success: function(data) {
				CommonHandler.fHandleSuccess("", "删除成功！");
			},
			error: function(data) {
				console.log("deleteUser error...");
			}
		});
	},
	/**
	 * 提交编辑
	 */
	fToEdit: function(e) {
		sForm = CommonHandler.fGetFormSerializable($("#editUserForm"));
		$.ajax({
			url: e.data.url,
			method: 'post',
			data: JSON.stringify(sForm),
			dataType: 'json',
			contentType: 'application/json',
			success: function(data) {
				CommonHandler.fHandleSuccess("", "修改成功！");
			},
			error: function(data) {
				console.log("saveUser error...");
			}
		});
	},
	/**
	 * 获取表单序列化数据，并返回json对象
	 * @param obj
	 */
	fGetFormSerializable: function(obj) {
		var fields = $(obj).serializeArray();
		
		// 组装json对象
		var sForm = {};
		$.each(fields, function(k, v){
			sForm[v.name] = v.value;
		});
		return sForm;
	},
	/**
	 * 操作成功
	 * @param title
	 * @param content
	 */
	fHandleSuccess: function(title, content) {
		var hsModal = $("#handleSuccess") ;
		// 打开模态框
		hsModal.modal("show");
		// 设置模态框内容
		if("" == title) {
			title = "提示";
		}
		hsModal.find(".modal-title").html(title);
		hsModal.find(".modal-body").html(content);
		hsModal.find(".btnConfirm").bind("click", CommonHandler.fReload);
	},
	/**
	 * 页面重新加载
	 */
	fReload: function() {
		window.location.reload();
	},
};
