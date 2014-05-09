(function(){
    $(function(){
        // FileReaderをサポートしているか調べる
        if (!window.File || !window.FileReader) {
            alert('ご使用のブラウザが画像のアップロードに対応していません。画像をアップロードされる場合には、推奨のブラウザにてご使用ください。');
        }

        // ファイルが指定されたタイミングで、その情報を表示
        $('#fileSelector').on('change', function(e){
            // File APIを利用できる場合のみ実行
            if (window.File) {
                // 指定されたファイルを取得
                var targetFile = this.files[0];

                // ファイル読み込みの準備
                var reader = new FileReader();

                // ファイルの読み込みに成功したら、その内容を<img id="js_targetImage">に反映
                reader.addEventListener('load', function(e) {
                    $("#js_targetImage").attr('src', reader.result);
                    $('#hdn_imamge').val(reader.result);
                }, false);

                // ファイルの内容をData URL形式で取得
                reader.readAsDataURL(targetFile);
              }
        });

        
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