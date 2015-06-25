class IsbnValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # :allow_oldパラメータが有効かどうかで正規表現を振り分け
    if options[:allow_odld]
      pattern = '\A([0-9]{3}-)?[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z'
    else
      pattern = '\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z'
    end
    # 指定された正規表現で入力値valueを検証
    record.errors.add(attribute, 'は正しい形式ではありません。') unless value =~ /#{pattern}/
  end
end
