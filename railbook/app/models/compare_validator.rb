class CompareValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # :compare_toパラメータで指定されたフィールドの値を取得
#    cmp = record.attributes[options[:compare_to]].to_i
    case options[:type]
      when :greater_than    # 検証項目が比較項目より大きいか
        record.errors.add(attribute, 'は指定項目より大きくなければなりません。')
# unless value > cmp
      when :less_than       # 検証項目が比較項目より大きいか
        record.errors.add(attribute, 'は指定項目より小さくなければなりません。')
# end
# unless value < cmp
      when :equal       # 検証項目が比較項目より大きいか
        record.errors.add(attribute, 'は指定項目より等しくなければなりません。')
# end
# unless value == cmp
      else
        raise 'unknown type'
# end
    end
  end
end
