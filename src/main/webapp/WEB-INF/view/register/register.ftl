<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>
    
    <body class="outline formContents">
        
        <#if errorMsg!?has_content>
            <div>
                ${errorMsg!?html}
            </div>
        </#if>
        
        <section>
            <div class="formArea autoMargin m10">
                <h1>新規登録</h1>
                <form method="post" action="${urlPath!?html}/register/regist" name="frm">
                    <div class="mt5">
                        <input type="email" name="email" id="email" placeholder="メールアドレスを入力してね" value="${email!?html}">
                    </div>
                    <div class="mt5">
                        <input type="password" name="password" id="password" placeholder="パスワードを入力してね" value="">
                    </div>
                </form>
        
                <div class="textCenter mv10">
                    <a id="js_registBtn" href="javascript:void(0)" class="btn btnPrimary jsTouchActive autoMargin">登録</a>
                </div>
            </div>
        </section>
        
        <nav>
            <div class="textCenter mv20">
                <a href="${urlPath}/" class="btn btnNormal jsTouchActive autoMargin">TOPへ</a>
            </div>
        </nav>
        
        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        
        <#-- JS - 新規登録 - -->
        <script>
            (function(){
                
                var registBtn = ci.qs('#js_registBtn');
                
                ci.bind(registBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>
        
    </body>
</html>