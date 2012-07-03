require 'spec_helper'

describe Message do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:content) }
end
