? $_mt->wrapper_file('wrapper.mt')->(sub {
               <div id="main">
                    <h2>ページ追加</h2>
                    <form method="post" action="/create_page">
                        name : <input type="text" name="name" /><br />
                        <input type="submit" value="さぶみる" /><br />
                    </form>
                    <hr />

                    <h2>アカウント追加</h2>
                    <form method="post" action="/create_account">
                        name : <input type="text" name="name" /><br />
                        password : <input type="password" name="password" /><br />
                        <input type="submit" value="さぶみる" /><br />
                    </form>
                    <hr />

                    <h2>ログイン</h2>
                    <form method="post" action="/login">
                        name : <input type="text" name="name" /><br />
                        password : <input type="password" name="password" /><br />
                        <input type="submit" value="さぶみる" /><br />
                    </form>
                    <hr />
? if (session->get('account')) {
                    <h2><a href="/logout">ログアウト</a></h2>
? }
               </div><!-- /main -->
? })
