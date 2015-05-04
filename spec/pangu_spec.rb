require "spec_helper"

describe Pangu do
  describe ".spacing" do
    it "adds spaces between numbers, English and Chinese" do
      expect(Pangu.spacing("請問Jackie的鼻子有幾個？123個！")).to \
        eql "請問 Jackie 的鼻子有幾個？123 個！"
    end

    it "avoids adding extra spaces" do
      expect(Pangu.spacing("請問 Jackie 的鼻子有幾個？123 個！")).to \
        eql "請問 Jackie 的鼻子有幾個？123 個！"
    end

    it "ignores underscore" do
      expect(Pangu.spacing("前面_後面")).to \
        eql "前面_後面"
      expect(Pangu.spacing("前面 _ 後面")).to \
        eql "前面 _ 後面"
    end

    it "handles tlid" do
      expect(Pangu.spacing("前面~後面")).to \
        eql "前面~ 後面"
      expect(Pangu.spacing("前面 ~ 後面")).to \
        eql "前面 ~ 後面"
    end

    it "handles exclamation mark" do
      expect(Pangu.spacing("前面!後面")).to \
        eql "前面! 後面"
    end

    it "handles question mark" do
      expect(Pangu.spacing("前面?後面")).to \
        eql "前面? 後面"
    end

    it "handles colon" do
      expect(Pangu.spacing("前面:後面")).to \
        eql "前面: 後面"
    end

    it "handles semicolon" do
      expect(Pangu.spacing("前面;後面")).to \
        eql "前面; 後面"
    end

    it "handles comma" do
      expect(Pangu.spacing("前面,後面")).to \
        eql "前面, 後面"
    end

    it "handles at" do
      expect(Pangu.spacing("請@vinta吃大便")).to \
        eql "請 @vinta 吃大便"
      expect(Pangu.spacing("請@陳上進 吃大便")).to \
        eql "請 @陳上進 吃大便"
    end

    it "handles hash" do
      expect(Pangu.spacing("前面#H2G2後面")).to \
        eql "前面 #H2G2 後面"
      expect(Pangu.spacing("前面#銀河便車指南 後面")).to \
        eql "前面 #銀河便車指南 後面"
      expect(Pangu.spacing("前面#銀河公車指南 #銀河大客車指南 後面")).to \
        eql "前面 #銀河公車指南 #銀河大客車指南 後面"
    end

    it "handles two hash" do
      expect(Pangu.spacing("前面#銀河閃電霹靂車指南#後面")).to \
        eql "前面 #銀河閃電霹靂車指南# 後面"
      expect(Pangu.spacing("前面#H2G2#後面")).to \
        eql "前面 #H2G2# 後面"
    end

    it "handles dollar" do
      expect(Pangu.spacing("前面$後面")).to \
        eql "前面 $ 後面"
    end

    it "handles percent" do
      expect(Pangu.spacing("前面%後面")).to \
        eql "前面 % 後面"
    end

    it "handles caret" do
      expect(Pangu.spacing("前面^後面")).to \
        eql "前面 ^ 後面"
    end

    it "handles ampersand" do
      expect(Pangu.spacing("前面&後面")).to \
        eql "前面 & 後面"
    end

    it "handles asterisk" do
      expect(Pangu.spacing("前面*後面")).to \
        eql "前面 * 後面"
    end

    it "handles back quote" do
      expect(Pangu.spacing("前面`後面")).to \
        eql "前面 ` 後面"
    end

    it "handles plus" do
      expect(Pangu.spacing("前面+後面")).to \
        eql "前面 + 後面"
    end

    it "handles minus" do
      expect(Pangu.spacing("前面-後面")).to \
        eql "前面 - 後面"
    end

    it "handles equal" do
      expect(Pangu.spacing("前面=後面")).to \
        eql "前面 = 後面"
    end

    it "handles pipe" do
      expect(Pangu.spacing("前面|後面")).to \
        eql "前面 | 後面"
    end

    it "handles slash" do
      expect(Pangu.spacing("前面/後面")).to \
        eql "前面 / 後面"
    end

    it "handles backslash" do
      expect(Pangu.spacing("前面\\後面")).to \
        eql "前面 \\ 後面"
    end

    it "handles parenthese" do
      expect(Pangu.spacing("前面(後面")).to \
        eql "前面 ( 後面"
      expect(Pangu.spacing("前面)後面")).to \
        eql "前面 ) 後面"
    end

    it "handles two parentheses" do
      expect(Pangu.spacing("前面(中文123漢字)後面")).to \
        eql "前面 (中文 123 漢字) 後面"
      expect(Pangu.spacing("前面(中文123)後面")).to \
        eql "前面 (中文 123) 後面"
      expect(Pangu.spacing("前面(123中文)後面")).to \
        eql "前面 (123 中文) 後面"
      expect(Pangu.spacing("前面(中文123) then")).to \
        eql "前面 (中文 123) then"
      expect(Pangu.spacing("前面(123中文) then")).to \
        eql "前面 (123 中文) then"
      expect(Pangu.spacing("前面( ) then")).to \
        eql "前面 ( ) then"
    end

    it "handles bracket" do
      expect(Pangu.spacing("前面[後面")).to \
        eql "前面 [ 後面"
      expect(Pangu.spacing("前面]後面")).to \
        eql "前面 ] 後面"
    end

    it "handles curly bracket" do
      expect(Pangu.spacing("前面{後面")).to \
        eql "前面 { 後面"
      expect(Pangu.spacing("前面}後面")).to \
        eql "前面 } 後面"
    end

    it "handles angle bracket" do
      expect(Pangu.spacing("前面<後面")).to \
        eql "前面 < 後面"
      expect(Pangu.spacing("前面>後面")).to \
        eql "前面 > 後面"
    end

    it "handles single quote" do
      expect(Pangu.spacing("前面'中文123漢字'後面")).to \
        eql "前面 '中文 123 漢字' 後面"
      expect(Pangu.spacing("前面' '後面")).to \
        eql "前面 ' ' 後面"
    end

    it "handles double quote" do
      expect(Pangu.spacing('前面"中文123漢字"後面')).to \
        eql '前面 "中文 123 漢字" 後面'
      expect(Pangu.spacing('前面" "後面')).to \
        eql '前面 " " 後面'
    end
  end
end
