require 'kconv'

result = ''
        # モデルのプロパティ名をカンマ区切りで出力（ヘッダ行）
result << "¥r"
        # テーブル内容を順にカンマ区切りで出力（データ行）
@books.each do |b|
  result << b.attributes.values.join(',')
  result << "¥r"
end

        # 最終的な結果（戻り値はShift-jis）
result.kconv(Kconv::SJIS, Kconv::UTF8)
