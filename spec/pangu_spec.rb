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
  end
end
