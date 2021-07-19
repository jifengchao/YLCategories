#
# Be sure to run `pod lib lint YLCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLCategories'
  s.version          = '0.1.3'
  s.summary          = 'A short description of YLCategories.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jifengchao/YLCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jifengchao' => '965524749@qq.com' }
  s.source           = { :git => 'https://github.com/jifengchao/YLCategories.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.public_header_files = 'YLCategories/YLCategories.h'
  s.source_files = 'YLCategories/YLCategories.h'


  #Foundation
  s.subspec 'Foundation' do |foundation|
      foundation.public_header_files = 'YLCategories/Foundation/YLFoundation.h'
      foundation.source_files = 'YLCategories/Foundation/YLFoundation.h'
      foundation.frameworks = 'Foundation'

      #三级
      foundation.subspec 'NSArray' do |array|
          array.source_files = 'YLCategories/Foundation/NSArray/*.{h,m}'
      end
      foundation.subspec 'NSDictionary' do |dictinoary|
          dictinoary.source_files = 'YLCategories/Foundation/NSDictionary/*.{h,m}'
      end
      foundation.subspec 'NSFileManager' do |filemanager|
          filemanager.source_files = 'YLCategories/Foundation/NSFileManager/*.{h,m}'
      end
      foundation.subspec 'NSObject' do |object|
          object.source_files = 'YLCategories/Foundation/NSObject/*.{h,m}'
      end
      foundation.subspec 'NSString' do |string|
          string.source_files = 'YLCategories/Foundation/NSString/*.{h,m}'
      end
      foundation.subspec 'NSURL' do |url|
          url.source_files = 'YLCategories/Foundation/NSURL/*.{h,m}'
      end
  end


  #UIKit
  s.subspec 'UIKit' do |uikit|
      uikit.public_header_files = 'YLCategories/UIKit/YLUIKit.h'
      uikit.source_files = 'YLCategories/UIKit/YLUIKit.h'
      uikit.frameworks = 'UIKit'

      #三级
      uikit.subspec 'UIApplication' do |application|
          application.source_files = 'YLCategories/UIKit/UIApplication/*.{h,m}'
      end
      uikit.subspec 'UIButton' do |button|
          button.source_files = 'YLCategories/UIKit/UIButton/*.{h,m}'
      end
      uikit.subspec 'UIImage' do |image|
          image.source_files = 'YLCategories/UIKit/UIImage/*.{h,m}'
      end
      uikit.subspec 'UIImageView' do |imageview|
          imageview.source_files = 'YLCategories/UIKit/UIImageView/*.{h,m}'
      end
      uikit.subspec 'UILabel' do |label|
          label.source_files = 'YLCategories/UIKit/UILabel/*.{h,m}'
      end
      uikit.subspec 'UINavigationBar' do |navigationbar|
          navigationbar.source_files = 'YLCategories/UIKit/UINavigationBar/*.{h,m}'
      end
      uikit.subspec 'UIPasteboard' do |pasteboard|
          pasteboard.source_files = 'YLCategories/UIKit/UIPasteboard/*.{h,m}'
      end
      uikit.subspec 'UITextField' do |textfield|
          textfield.source_files = 'YLCategories/UIKit/UITextField/*.{h,m}'
      end
      uikit.subspec 'UITextView' do |textview|
          textview.source_files = 'YLCategories/UIKit/UITextView/*.{h,m}'
      end
      uikit.subspec 'UIView' do |view|
          view.source_files = 'YLCategories/UIKit/UIView/*.{h,m}'
      end
      uikit.subspec 'UIViewController' do |viewcontroller|
          viewcontroller.source_files = 'YLCategories/UIKit/UIViewController/*.{h,m}'
      end
  end


end
