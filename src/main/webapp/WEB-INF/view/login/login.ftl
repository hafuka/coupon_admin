<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>
    
    <body class="outline formContents">
        
        <section>
            <h1 style="padding: 10px; background-color: #fbe796;">
                <div class="table autoMargin">
                    <div class="cell">
                        <img src="${imagePath}/images/top/top_main.png" width="70" height="70">
                    </div>
                    <div class="cell fs20 vMiddle pl10" style="line-height: 30px;">
                        COUPON ISLAND管理ツール
                    </div>
                </div>
            </h1>
            
            <#if errorMsg!?has_content>
                <div class="textCenter fcOrange fs18" style="margin-top: 30px;">
                    ${errorMsg!?html}
                </div>
            </#if>
            
            <div class="formArea autoMargin" style="margin: 30px auto; width: 500px;">
                <h1 class="mb10 fs20 p5">ログイン</h1>
                <form method="post" action="${urlPath!?html}/login/login" name="frm">
                    <div class="mt10">
                        <input type="email" name="email" id="email" placeholder="メールアドレスを入力して下さい" value="${email!?html}">
                    </div>
                    <div class="mt10">
                        <input type="password" name="password" id="password" placeholder="パスワードを入力して下さい" value="">
                    </div>
                </form>
                
                <div class="textCenter mb10 mt20">
                    <a id="js_loginBtn" href="javascript:void(0)" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px; height: 60px; line-height: 45px;">ログイン</a>
                </div>
            </div>
        </section>
        
        
        <nav>
            <div class="textCenter mv20">
                <a href="${urlPath}/register" class="btn btnPrimary jsTouchActive autoMargin" style="width: 250px; height: 60px; line-height: 45px;">新規店舗登録はこちら>></a>
            </div>
        </nav>
        
        <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
            Copyright &copy; hubfactory
        </div>
        
        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        
        <#-- JS - ログイン - -->
        <script>
            (function(){
                
                var loginBtn = ci.qs('#js_loginBtn');
                
                ci.bind(loginBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>
        
    </body>
</html>