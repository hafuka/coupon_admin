
function mainCtrl($scope){
    
    //店舗名必須項目メッセージ用
    $scope.shopName = $('input[name=shopName]').val();
    $scope.okMessageShopName = '';
    $scope.shopNameSuccess = false;
    
    //店舗名が入力されていればメッセージを出す
    $scope.$watch('shopName', function(newValue, oldValue){
        if($scope.shopName != undefined){
            $scope.okMessageShopName = "OKです";
            $scope.shopNameSuccess = true;
        }else{
            $scope.okMessageShopName = "";
            $scope.shopNameSuccess = false;
        }
    });
    
    //店舗説明必須項目メッセージ用
    $scope.description = $('input[name=description]').val();
    $scope.okMessageDescription = '';
    $scope.descriptionSuccess = false;
    
    //店舗説明が入力されていればメッセージを出す
    $scope.$watch('description', function(newValue, oldValue){
        if($scope.description != undefined){
            $scope.okMessageDescription = "OKです";
            $scope.descriptionSuccess = true;
        }else{
            $scope.okMessageDescription = "";
            $scope.descriptionSuccess = false;
        }
    });
    
    //電話番号必須項目メッセージ用
    $scope.tel = $('input[name=tel]').val();
    $scope.okMessageTel = '';
    $scope.telSuccess = false;
    
    //電話番号が入力されていればメッセージを出す
    $scope.$watch('tel', function(newValue, oldValue){
        if(($scope.tel != undefined) && ($scope.tel.length > 11)){
            $scope.okMessageTel = "OKです";
            $scope.telSuccess = true;
        }else{
            $scope.okMessageTel = "";
            $scope.telSuccess = false;
        }
    });
    
    //住所必須項目メッセージ用
    $scope.address = $('input[name=address]').val();
    $scope.okMessageAddress = '';
    $scope.adressSuccess = false;
    
    //住所が入力されていればメッセージを出す
    $scope.$watch('address', function(newValue, oldValue){
        if($scope.address != undefined){
            $scope.okMessageAddress = "OKです";
            $scope.adressSuccess = true;
        }else{
            $scope.okMessageAddress = "";
            $scope.adressSuccess = false;
        }
    });
    
    //最寄駅必須項目メッセージ用
    $scope.station = $('input[name=station]').val();
    $scope.okMessageStation = '';
    $scope.stationSuccess = false;
    
    //最寄駅名が入力されていればメッセージを出す
    $scope.$watch('station', function(newValue, oldValue){
        if($scope.station != undefined){
            $scope.okMessageStation = "OKです";
            $scope.stationSuccess = true;
        }else{
            $scope.okMessageStation = "";
            $scope.stationSuccess = false;
        }
    });
    
    //地域必須項目メッセージ用
    $scope.areaId = $('select[name=areaId]').val();
    $scope.okMessageAreaId = '';
    $scope.areaIdSuccess = false;
    
    //地域が選択されていればメッセージを出す
    $scope.$watch('areaId', function(newValue, oldValue){
        if($scope.areaId != 0){
            $scope.okMessageAreaId = "OKです";
            $('#js_areaMessage').removeClass('inlineBlock');
            $('#js_areaMessage').addClass('none');
            
            $('#js_areaDetailMessage').removeClass('none');
            $('#js_areaDetailMessage').addClass('inlineBlock');
            $('#js_areaDetailOkMessage').addClass('none');
            $('#js_areaDetailOkMessage').removeClass('inlineBlock');
            
            $scope.areaIdSuccess = true;
        }else{
            $scope.okMessageAreaId = "";
            $('#js_areaMessage').removeClass('none');
            $('#js_areaMessage').addClass('inlineBlock');
            
            $('#js_areaDetailMessage').removeClass('none');
            $('#js_areaDetailMessage').addClass('inlineBlock');
            $('#js_areaDetailOkMessage').addClass('none');
            $('#js_areaDetailOkMessage').removeClass('inlineBlock');
            
            $scope.okMessageAreaDetailId = "";
            
            $scope.areaIdSuccess = false;
        }
    });
    
    //エリア必須項目メッセージ用
    $scope.areaDetailId = $('select[name=areaId]').val();
    $scope.okMessageAreaDetailId = '';
    $scope.areaDetailIdSuccess = false;
    
    //エリアが選択されていればメッセージを出す
    $scope.$watch('areaDetailId', function(newValue, oldValue){
        if($scope.areaDetailId != 0){
            $scope.okMessageAreaDetailId = "OKです";
            $('#js_areaDetailMessage').removeClass('inlineBlock');
            $('#js_areaDetailMessage').addClass('none');
            $('#js_areaDetailOkMessage').addClass('inlineBlock');
            $('#js_areaDetailOkMessage').removeClass('none');
            
            $scope.areaDetailIdSuccess = true;
        }else{
            $scope.okMessageAreaDetailId = "";
            $('#js_areaDetailMessage').removeClass('none');
            $('#js_areaDetailMessage').addClass('inlineBlock');
            $('#js_areaDetailOkMessage').addClass('none');
            $('#js_areaDetailOkMessage').removeClass('inlineBlock');
            
            $scope.areaDetailIdSuccess = false;
        }
    });
    
    //業種必須項目メッセージ用
    $scope.businessId = $('select[name=businessId]').val();
    $scope.okMessageBusinessId = '';
    $scope.businessIdSuccess = false;
    
    //業種が選択されていればメッセージを出す
    $scope.$watch('businessId', function(newValue, oldValue){
        if($scope.businessId != 0){
            $scope.okMessageBusinessId = "OKです";
            $('#js_businessMessage').removeClass('inlineBlock');
            $('#js_businessMessage').addClass('none');
            
            $scope.businessIdSuccess = true;
        }else{
            $scope.okMessageBusinessId = "";
            $('#js_businessMessage').removeClass('none');
            $('#js_businessMessage').addClass('inlineBlock');
            
            $scope.businessIdSuccess = false;
        }
    });

    
    // クーポンの合計値を表示する部分：ここから

    // それぞれのパーセンテージの値を初期化する
    $scope.srScore = parseInt($('input[name=srScore]').val());
    $scope.rScore = parseInt($('input[name=rScore]').val());
    $scope.nScore = parseInt($('input[name=nScore]').val());
    $scope.getMessage = '';
    
    //合計パーセンテージを計算する関数
    $scope.getAmount = function(){
        return  $scope.srScore + $scope.rScore + $scope.nScore;
    }
    
    //合計値によってメッセージを出し分け
    $scope.$watch("getAmount()", function(newValue, oldValue){
      if($scope.getAmount() > 100){
        $scope.getMessage = "合計値が100%を超えました。ちょうど100%になるように設定してください。";
      }else if($scope.getAmount() < 100){
        $scope.getMessage = "ちょうど100%になるように設定してください。";
      }else if($scope.srScore >= $scope.rScore){
          $scope.getMessage = "SRクーポンはRクーポンよりパーセンテージを低くしてください。";
      }else if($scope.rScore >= $scope.nScore){
          $scope.getMessage = "RクーポンはNクーポンよりパーセンテージを低くしてください。";
      }else if($scope.getAmount() == 100){
          $scope.getMessage = "適正数値です♪";
      }
    });
    
    //クーポン情報必須項目用
    $scope.srCouponText = $('input[name=srCouponText]').val();
    $scope.rCouponText = $('input[name=rCouponText]').val();
    $scope.nCouponText = $('input[name=nCouponText]').val();
    $scope.okMessageCouponInfo = '';
    $scope.couponInfoSuccess = false;
    
    $scope.couponInfo = function(){
        if( ($scope.srCouponText != undefined) && 
            ($scope.rCouponText != undefined) && 
            ($scope.nCouponText != undefined) && 
            ($scope.srScore + $scope.rScore + $scope.nScore == 100) && 
            ($scope.srScore < $scope.rScore) && 
            ($scope.rScore < $scope.nScore) ) {
            
            $scope.couponInfoSuccess = true;
            
        }
        return  $scope.couponInfoSuccess;
    }
    
    
    //クーポン情報が入力されていればメッセージを出す
    $scope.$watch('couponInfo()', function(newValue, oldValue){
        if($scope.couponInfo() == true){
            $scope.okMessageCouponInfo = "OKです";
            $('#js_couponInfo').removeClass('inlineBlock');
            $('#js_couponInfo').addClass('none');
            
            $scope.couponInfoSuccess = true;
        }else{
            $scope.okMessageCouponInfo = "";
            $('#js_couponInfo').removeClass('none');
            $('#js_couponInfo').addClass('inlineBlock');
            
            $scope.couponInfoSuccess = false;
        }
    });
    
    var allRegistFlg = false;

    $scope.successInfo = function(){
        if( ($scope.shopNameSuccess == true) && 
            ($scope.descriptionSuccess == true) && 
            ($scope.telSuccess == true) && 
            ($scope.adressSuccess == true) && 
            ($scope.stationSuccess == true) && 
            ($scope.areaIdSuccess == true) && 
            ($scope.areaDetailIdSuccess == true) && 
            ($scope.businessIdSuccess == true) && 
            ($scope.couponInfoSuccess == true) ) {
            
            allRegistFlg = true;
            
        }
        return  allRegistFlg;
    }
    
    //すべて入力OKだったら登録ボタン！
    $scope.$watch('successInfo()', function(newValue, oldValue){
    	console.log($scope.successInfo());
        if($scope.successInfo() == true){
            $('#js_noRegistArea').addClass('none');
            $('#js_registArea').removeClass('none');
        }else{
            $('#js_noRegistArea').removeClass('none');
            $('#js_registArea').addClass('none');
        }
    });

}