require 'rails_helper'

RSpec.describe Inclusion, type: :model do


  subject { described_class.new(vid: "Austin") }

  it "is valid with a valid vid" do
    expect(subject).to be_valid
  end

  it "is not valid with an empty vid" do
    subject.vid = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a lowercase vid" do
    subject.vid = "chicago"
    expect(subject).to_not be_valid
  end

  it "is valid with an all-uppercase vid" do
    subject.vid = "AUSTIN"
    expect(subject).to be_valid
  end

  it "is not valid with a capitalized vid and numbers" do
    subject.vid = "Austin123"
    expect(subject).to_not be_valid
  end

  it "is not valid since it is not in the database" do
    subject.vid = "Rome"
    expect(subject).to_not be_valid
  end

  it "is not valid with special characters in vid" do
    subject.vid = "Austin!"
    expect(subject).to_not be_valid
  end

  it "is not valid with a vid longer than 255 characters" do
    subject.vid = "A" * 256
    expect(subject).to_not be_valid
  end

  it "is valid with showing all edges" do
    subject.vid = "Austin"
    expect(subject).to eq("ae", "ab")
  end

  it "is not valid because it is not showing correct edges" do
    subject.vid = "Austin"
    expect(subject).to_not eq("lb")
  end
end


