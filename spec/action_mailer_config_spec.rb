# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ActionMailerConfig do
  subject { ActionMailer::Base }
  describe ".load" do
    context "delivery_method: test" do
      before do
        ActionMailerConfig.load(
          "delivery_method" => "test"
        )
      end
      its(:delivery_method) { should == :test }
    end
    context "delivery_method: smtp" do
      before do
        ActionMailerConfig.load(
          "delivery_method" => "smtp",
          "port" => 1234,
          "address" => "mail.example.com",
          "some_setting" => "some value"
        )
      end
      its(:delivery_method) { should == :smtp }
      its(:smtp_settings) {
        should == {port: 1234, address: "mail.example.com", some_setting: "some value"}
      }
    end
    context "delivery_method: sendmail" do
      before do
        ActionMailerConfig.load(
          "delivery_method" => "sendmail",
          "location" => "/path/to/sendmail",
          "arguments" => "--some-arguments"
        )
      end
      its(:delivery_method) { should == :sendmail }
      its(:sendmail_settings) {
        should == {location: "/path/to/sendmail", arguments: "--some-arguments"}
      }
    end
    context "delivery_method: letter_opener" do
      before do
        ActionMailerConfig.load(
          "delivery_method" => "letter_opener",
          "location" => "/path/to/letter_opener",
        )
      end
      its(:delivery_method) { should == :letter_opener }
      its(:letter_opener_settings) {
        should == {location: "/path/to/letter_opener"}
      }
    end
    context "delivery_method: mailcatcher" do
      before do
        ActionMailerConfig.load(
          "delivery_method" => "mailcatcher"
        )
      end
      its(:delivery_method) { should == :smtp }
      its(:smtp_settings) {
        should == {port: 1025}
      }
      context "override default port" do
        before do
          ActionMailerConfig.load(
            "delivery_method" => "mailcatcher",
            "port" => 1234
          )
        end
        its(:smtp_settings) {
          should == {port: 1234}
        }
      end
    end
  end
end
