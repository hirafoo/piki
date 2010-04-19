? $_mt->wrapper_file('wrapper.mt')->(sub {
               <div id="main">
               <form action="/page/edit/<?= utf->decode(p->{name}) ?>" method="post">
               <div>
               <textarea name="content" rows="20" cols="65"><?= p->{content} ?></textarea>
               </div>
               <input type="submit" value="さぶる" />
               </form>
               </div><!-- /main -->
? })
