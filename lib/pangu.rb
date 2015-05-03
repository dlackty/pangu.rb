require "pangu/version"

module Pangu
  CJK_QUOTE_L_RE = /([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(["\'])/i
  CJK_QUOTE_R_RE = /(["\'])([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])/i
  CJK_QUOTE_FIX_RE = /(["\']+)(\s*)(.+?)(\s*)(["\']+)/i

  CJK_BRACKET_RE = /([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([<\[\{\(]+(.*?)[>\]\}\)]+)([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])/i
  CJK_BRACKETFIX_RE = /([<\[\{\(]+)(\s*)(.+?)(\s*)([>\]\}\)]+)/i
  CJK_BRACKET_L_RE = /([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([<>\[\]\{\}\(\)])/i
  CJK_BRACKET_R_RE = /([<>\[\]\{\}\(\)])([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])/i

  CJK_HASH_L_RE = /([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#(\S+))/i
  CJK_HASH_R_RE = /((\S+)#)([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])/i

  CJK_L_RE = /([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([a-z0-9`@&%=\$\^\*\-\+\|\/\\])/i
  CJK_R_RE = /([a-z0-9`~!%&=;\|\,\.\:\?\$\^\*\-\+\/\\])([\u3040-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])/i

  def self.spacing(text)
    text = text.dup

    text.gsub!(CJK_QUOTE_L_RE, "\\1 \\2")
    text.gsub!(CJK_QUOTE_R_RE, "\\1 \\2")
    text.gsub!(CJK_QUOTE_FIX_RE, "\\1\\3\\5")

    old_text = text
    new_text = old_text.gsub(CJK_BRACKET_RE, "\\1 \\2 \\4")
    text = new_text

    if old_text == new_text
      text.gsub!(CJK_BRACKET_L_RE, "\\1 \\2")
      text.gsub!(CJK_BRACKET_R_RE, "\\1 \\2")
    end

    text.gsub!(CJK_BRACKETFIX_RE, "\\1\\3\\5")

    text.gsub!(CJK_HASH_L_RE, "\\1 \\2")
    text.gsub!(CJK_HASH_R_RE, "\\1 \\3")

    text.gsub!(CJK_L_RE, "\\1 \\2")
    text.gsub!(CJK_R_RE, "\\1 \\2")

    text
  end
end
