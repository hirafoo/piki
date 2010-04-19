? $_mt->wrapper_file('wrapper.mt')->(sub {
               <div id="main">
                   <a href="/page/edit/<?= utf->decode(p->{name}) ?>">このページを編集</a>
? if (p->{content}) {
<?= p->{content} ?>
? }
               </div><!-- /main -->
? })
