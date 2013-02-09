require 'spec_helper'

describe SessionsHelper do

describe "#store_status" do
  @time = Time.
  Time.stubs(:now).returns(@time)
