                <div id="sub">
                    <div class="section">
                        <h2>ページs</h2>
                        <ul>
? while (my $page = p->{pages}->next) {
                            <li><a href="/page/<?= $page->name ?>"><?= $page->name ?></a></li>
? }
                        </ul>
                    </div><!-- /section -->
                    <div class="section">
                        <h2>アカウントs</h2>
? while (my $ac = p->{accounts}->next) {
                            <li><?= $ac->name ?></li>
? }
                    </div><!-- /section -->
                </div><!-- /sub -->
