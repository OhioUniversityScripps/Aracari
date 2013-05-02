require 'spec_helper'

describe Import do
  it "should require a file" do
    import = build(:import)
    import.archive = nil
    import.valid?.should be(false)
    import.errors.messages.should include(archive: ["must be attached"])
  end
end
