class CreatePage < ActiveRecord::Migration
  def self.up
    create_table :page do |t|
      t.string :name,    :null => false, :default => ''
      t.text   :content, :null => false, :default => ''

      t.timestamps
    end

    page = Page.new
    page.name = "サンプルページ"
    page.content = "はてな記法サンプル\n\n*オートリンク\nhttp://example.com/\n\n*タイトル付きリンク\n[http://example.com/:title=えぎざんぷるどっとこむ]\n\n*mailtoなリンク\nsend me a mail mailto:info@example.com\n\n*画像\n[http://localhost:3000/images/hirafoo.jpg:image]\nlocalhost:3000 の部分は適宜変更のこと。\n\n*quotedらしい\n>>\nほげ\nふが\nfoo\n<<\n\n*h3タグ\n**h4タグ\n***h5タグ\ncssの都合上h4/h5が同じに見えます\n\n\n+番号付きのli\n+2個目\n++番号付きのli 段落2\n+++番号付きのli 段落3\n"
    page.save
  end

  def self.down
    drop_table :page
  end
end
