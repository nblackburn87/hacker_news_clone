require 'spec_helper'

describe Post do

  it { should validate_presence_of :title}
  it { should validate_presence_of :user }
  it { should have_many :comments }
end
