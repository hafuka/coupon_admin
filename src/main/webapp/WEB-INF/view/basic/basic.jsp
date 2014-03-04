<!DOCTYPE html>
<html lang="ja">
    <head>
        <style>
			.thumb {
				height: 75px;
				border: 1px solid #000;
				margin: 10px 5px 0 0;
			}
		</style>
    </head>
    
    <body class="outline formContents">
        <section>
            基本情報
        </section>
        <section>
        	
        	<form method="post" action="/coupon_admin/basic/regist" name="frm">
        		<input type="file" name="formFile" />
        		<div>
	        		<input type="file" id="files" name="image" enctype="multipart/form-data" />
	            	<output id="list"></output>
            	</div>
        		<div>
        			店舗名：<input type="text" id="shopName" name="shopName">
        		</div>
        		<div>
        			店舗説明：<input type="text" id="description" name="description">
        		</div>
        		<div>
        			URL：<input type="text" id="url" name="url">
        		</div>
        		<div>
        			電話番号：<input type="text" id="tell" name="tell">
        		</div>
        		<div>
        			住所：<input type="text" id="address" name="address">
        		</div>
        		<div>
        			最寄駅：<input type="text" id="station" name="station">
        		</div>
        	</form>
        	
        	<div class="textCenter mv10">
                <a id="js_registBtn" href="javascript:void(0)" class="btn btnNormal jsTouchActive autoMargin">ログイン</a>
            </div>
            
        </section>
        
        <script src="/coupon_admin/js/jquery-2.1.0.min.js.js"></script>
        <script src="/coupon_admin/js/basic.js"></script>
        
        <#-- JS - ログイン - -->
        <script>
            (function(){
                var loginBtn = ci.qs('#js_registBtn');
                ci.bind(loginBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>
        
    </body>
</html>