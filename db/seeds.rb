# frozen_string_literal: true

return unless Rails.env.development? || ENV["SEED_LEGACY_CONTENT"] == "1"

def seed_diary_entries!
  return if DiaryEntry.exists?

  [
    {
      entry_date: Date.new(2026, 2, 22),
      body: "資格勉強を始めました。基本情報技術者試験を受けるのだ。まずは基数変換とかの基礎中の基礎から復習。\n4月25日の試験に向けてぼちぼち頑張るぜ。やや真面目なやつは別のページに作成してもありかなと思ったりしている。",
      image: "study_text.JPG",
      image_alt: "参考書"
    },
    {
      entry_date: Date.new(2025, 10, 16),
      body: "リアル脱出ゲームに行ってきたのだ。これで3回目？のリア脱なのだ。\n脱出できなかったのだ。ラストのところで閃けなかったの悔しいのだ。でも楽しめたのだ。またリア脱したいのだ。",
      image: "Tokidoki-senseidassyutu.JPG",
      image_alt: "ときどき先生脱出"
    },
    {
      entry_date: Date.new(2025, 10, 9),
      body: "恋愛免許証って診断をやったのだ。こういう診断系って、なんかやりたくなっちゃうよね。結果は画像の通りだったのだ。\n他の人のやつこっそりみてたら、みんな上げて落とされる感じのこととか書いてあったのだ。\n上げて落とす手法は一番メンタルにくるものだと思っているのだ。\n具なし味噌汁ってなんなのだ？安心するけど、物足りないってこと？",
      image: "love-licence.png",
      image_alt: "恋愛免許証"
    },
    {
      entry_date: Date.new(2025, 10, 2),
      body: "Love Type 16とかって診断やったのだ。忠犬ハチ公タイプだったのだ。イメージ通りとか言われてなんか癪だったのだ。\nでもそれを証明するようなエピソードを持っているのだ。否定できないのだ。悔しいのだ。",
      image: "FCPE.png",
      image_alt: "FCPE 忠犬ハチ公"
    },
    {
      entry_date: Date.new(2025, 10, 2),
      body: "にょっす🐮✋　気温の変化によって手の皮が剥け始めました。もう秋ですね。季節の変わり目を感じます。",
      image: nil,
      image_alt: nil
    },
    {
      entry_date: Date.new(2025, 9, 25),
      body: "*下の文は生成AIが勝手に作った文章・画像です。出来事とか、思ったことをAIに解釈させて書くのとか面白そう\n\nはじめてのウェブサイト作り。どうなることかと思ったけど、好きなものを詰め込む秘密基地みたいで、なんだかワクワクする。とりあえず、この前行ったカフェの写真でも貼っておこうかな。",
      image: "https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=500",
      image_alt: "おしゃれなカフェのコーヒー"
    }
  ].each { |attrs| DiaryEntry.create!(attrs) }
end

def seed_update_log_entries!
  return if UpdateLogEntry.exists?

  UpdateLogEntry.create!(
    log_date: Date.new(2025, 10, 17),
    title: nil,
    body: <<~HTML
      <strong>リンク集の変更</strong>
      <ul>
        <li>弊学のホームページへのリンクをGoogle documentに変更しました。</li>
        <ul>
          <li>このサイトの今後の展望や、実装してみたいものなどをメモ書きしています。</li>
          <li>コメント可能に設定しているので、意見箱としてもご利用いただけます。</li>
        </ul>
      </ul>
      <strong>新規ページ「しばいぬのヒミツ」の準備を開始しました。</strong>
      <ul>
        <ul>
          <li>該当ページは準備中であり、まだコンテンツは実装していません。</li>
          <li>日記とは別の、もっと前から続いていることであったり、常習的な面を言語化するページにする予定です。</li>
        </ul>
      </ul>
    HTML
  )

  UpdateLogEntry.create!(
    log_date: Date.new(2025, 10, 9),
    title: "リンク集の追加",
    body: "<ul><li>作者のSNSリンク集をホームに作成しました。</li></ul>"
  )

  UpdateLogEntry.create!(
    log_date: Date.new(2025, 10, 3),
    title: "サイトのレスポンシブ対応",
    body: <<~HTML
      <ul>
        <li>スマートフォンでの表示崩れを修正しました。</li>
        <li>画面幅に合わせてレイアウトが自動で切り替わります。</li>
      </ul>
      <strong>追加ログの公開</strong>
      <ul>
        <li>追加ログの内容を公開しました。</li>
      </ul>
    HTML
  )

  UpdateLogEntry.create!(
    log_date: Date.new(2025, 10, 3),
    title: "サイトの公開",
    body: "<ul><li>「しばいぬの日記帳」を公開しました。</li></ul>"
  )
end

def seed_artist_entries!
  return if ArtistEntry.exists?

  partial_path = Rails.root.join("app/views/pages/_fav_artist_content.html.erb")
  return unless partial_path.exist?

  fragment = Nokogiri::HTML.fragment(File.read(partial_path, encoding: "UTF-8"))
  fragment.css("li.with-icon").each_with_index do |item, index|
    name = item.children.find { |node| node.text? && node.text.strip.present? }&.text&.strip
    next if name.blank?

    item.children.find { |node| node.text? && node.text.strip == name }&.remove
    body = item.inner_html.strip

    ArtistEntry.create!(name: name, body: body, position: index + 1)
  end
end

seed_diary_entries!
seed_update_log_entries!
seed_artist_entries!
