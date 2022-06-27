module FlashHelper
  def classes_for_flash(type)
    case type.to_sym
    when :error
      "from-red-500 to-red-400"
    else
      "from-green-500 to-green-400"
    end
  end

  def flash_title(type)
    case type.to_sym
    when :error
      'Warning'
    else
      'Success'
    end
  end
end
