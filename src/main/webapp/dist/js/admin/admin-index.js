
/**
 * 后台首页操作
 */
$(function() {
	fGetStatisInfo();
});

/**
 * 获取统计信息项
 */
function fGetStatisInfo() {
	console.log("66666666666666666");
	$.ajax({
		url: 'admin/Index/getStatisticInfo.do',
		method: 'get',
		dataType: 'json',
		success: function(data) {
			var oImgF = '<img data-src="holder.js/200x200?theme=social&size=20&text=';
			var oImgB = '" class="img-responsive" alt="Generic placeholder thumbnail">';
			$("#userCount").append(oImgF+ data.userCount +oImgB);
			$("#packageCount").append(oImgF+ data.packageCount +oImgB);
		},
		error: function(data) {
			console.log("get statistic info error...");
		}
	});
}