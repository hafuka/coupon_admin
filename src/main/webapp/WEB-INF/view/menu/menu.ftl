<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>
    
    <body class="outline formContents">
        <section>
            メニュー
        </section>
        <section>
        	<div>
        		<a href="${urlPath!?html}/basic">店舗情報</a>
        	</div>
        </section>
        
        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        
    </body>
</html>