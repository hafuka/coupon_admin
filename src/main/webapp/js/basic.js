(function(){
	$(function(){
		// Check for the various File API support.
		if (window.File && window.FileReader && window.FileList && window.Blob) {
		} else {
		  alert('The File APIs are not fully supported in this browser.');
		}


		function handleFileSelect(evt) {
			$('#list').html('');

			var files = evt.target.files; // FileList object

			// Loop through the FileList and render image files as thumbnails.
			var f = files[0];
			// Only process image files.
			if (!f.type.match('image.*')) {
				alert('file is noe iamge ');
				return;
			}

			var reader = new FileReader();

			// Closure to capture the file information.
			reader.onload = (function(theFile) {
				return function(e) {
					// Render thumbnail.
					var span = document.createElement('span');
					span.innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
					document.getElementById('list').insertBefore(span, null);
					$('#hdn_imamge').val(e.target.result);
				};
			})(f);

			// Read in the image file as a data URL.
			reader.readAsDataURL(f);
		}

		document.getElementById('files').addEventListener('change', handleFileSelect, false);


		// 地域セレクト
		var $areaSelect = $('#js_areaChange');
		var $areaSearchList = $('#js_searchAreaDetailList');


		// 地域が変更されたらajax通信を開始
		$areaSelect.on('change', function(){
			ajaxGetAreaDetailList();
		});

		// ajax通信
		function ajaxGetAreaDetailList() {
			areaId = $('select[name=areaId]').val();
			var url = urlPath + "/basic/changeArea";
			var formData = "areaId=" + areaId;
			ajaxJsonGlobal(url, formData, searchAreaDetailSuccess);
		}

		// ajax成功
		function searchAreaDetailSuccess(data){
			if (data != '') {
				// リストをJS-RENDERのテンプレートでDOMに追加
				$areaSearchList.html(
					$("#searchAreaDetailList_template").render(returnSearchAreaDetailList(data))
				);
			} else {
				// リストをJS-RENDERのテンプレートでDOMに追加
				$areaSearchList.html(
					$("#searchAreaDetailList_template").render(returnSearchAreaDefault())
				);
			}
			
			$('#js_areaDetailMessage').removeClass('none');
            $('#js_areaDetailMessage').addClass('inlineBlock');
            $('#js_areaDetailOkMessage').addClass('none');
            $('#js_areaDetailOkMessage').removeClass('inlineBlock');
		}

		// ajax成功時にリストを取得
		function returnSearchAreaDetailList(data){
			var areaDetailList = [];
			targetList = {
				"areaValue": 0,
				"areaName": "ｴﾘｱを選択してください",
			};
			areaDetailList.push(targetList);

			var targetList;
			var len = data.length;

			for( var i = 0; i < len; i++ ){
				var dataList = data[i];
				targetList = {
					"areaValue": dataList.value,
					"areaName": dataList.label,
				};
				areaDetailList.push(targetList);
			}
			return areaDetailList;
		}

		// ajax成功時にリストを取得
		function returnSearchAreaDefault(){
			var areaDetailList = [];
			targetList = {
				"areaValue": 0,
				"areaName": "ｴﾘｱを選択してください",
			};
			areaDetailList.push(targetList);
			return areaDetailList;
		}
	});
})();