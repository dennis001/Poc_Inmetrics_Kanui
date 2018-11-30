require 'rspec'
require 'appium_lib'
require 'pry'
require 'faker'
require 'selenium-webdriver'
require 'cpf_faker'
require 'httparty'
require 'cucumber'
require 'capybara/cucumber'
require 'site_prism'


def wait_for
    Selenium::WebDriver::Wait.new(:timeout => 10).until { yield }
end

def caps
{ caps: {
    deviceName: "Anyname",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "Kanui.apk")),
    appPackage: "br.com.kanui",
    appActivity: "br.com.kanui.activity.HomeActivity_",
    newCommandTimeout: "3600"
}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

=begin
dumpsys window windows | grep -E �mCurrentFocus|mFocusedApp�
=end
