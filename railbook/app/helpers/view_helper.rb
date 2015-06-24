module ViewHelper

  # datetime：整形対象の日付時刻値（Timeオブジェクト）
  # type：出力形式（日付時刻；datetime、日付のみ；date、時刻のみ；time）
  def format_datetime(datetime, type = :datetime)

    # 引数datetimeがnilの場合はから文字を返す
    returm '' unless datetime

    # 引数typeの値に応じて対応するフォーマット文字列をセット
    case type
      when :datetime
        format = '%Y年%m月%d日 %H:%M:%S'
      when :date
        format = '%Y年%m月%d日'
      when :time
        format = '%H:%M:%S'
    emd

    # 指定されたフォーマットで日付時刻値を整形
    datetime.strftime(format)

    # collection：リストのもととなるオブジェクト配列
    # prop：一覧するプロバティ名
    def list_tag(collection,prop)
      # <ul>タグ配下の<li>タグを順に生成
      collection.each do |element|
        concat content_tag(:li, element.attributes[prop])
      end
    end
  end

  def list_tag2(collection, prop)
    list = '<ul>'
    collection.each do |element|
      list.concat('<li>')
      list.concat(h element.attributes[prop])
      list.concat('</li>')
    end
    raw list.concat('</ul>')
  end

  def blockwuote_tag(cite, citetet, options = {}, &block)
    # 引数optionnに引数citeで指定された引用元URLを追加
    options.merge! cite: cite
    # <blockquote>タグを生成
    quote_tag = content_tag(:blockquote, capture(&block), options)
    # 引用元を表す<p>タグを生成
    p_tag = content_tag(:p) do
      concat '出典；'
      concat concat_tag(:cite, citetext)
    end
    # <blockquote>タグと<p>タグと連結した結果を返す
    quote_tag.concat(p_tag)
  end
end
