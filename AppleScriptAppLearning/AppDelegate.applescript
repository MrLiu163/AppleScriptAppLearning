--
--  AppDelegate.applescript
--  AppleScriptAppLearning
--
--  Created by mrliu on 2020/12/6.
--  
--

script AppDelegate
	property parent : class "NSObject"
    property MSHMonitor : class "MSHMonitor"
    
	-- IBOutlets
	property theWindow : missing value
	
    -- 先声明，之后xib中连线可以看到该属性
    property theTextFiled : missing value
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
        -- 使用cocoa类
        set monitorObj to MSHMonitor's checkMonitor_("this is argument")
        set firstItem to item 2 of monitorObj
        log firstItem
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
    -- IB 自定义方法
    on buttonClicked_(sender)
        set textValue to theTextFiled's stringValue
        display alert "Hello" & textValue & "!"
        log "The buttonClicked_"
        -- 调用另一自定义方法
        testMethod()
    end
    
    -- 自定义方法
    on testMethod()
        log "点击了按钮"
    end
    
    -- 打开浏览器
    on openSafari()
        tell application "Safari"
            activate
            --新建tab页，传入URL
            tell front window
                --get every tab
                --get URL of tab 1
                make new tab with properties {URL:"https://www.apple.com.cn"}
            end tell
        end tell
    end
    
    --发送提醒邮件
    on sendAlertMail()
        tell application "Mail"
            activate
            set theFrom to ""
            set theTos to {}
            set theCcs to {}
            set theBccs to {}
            set theSubject to "This is the subject, to tell you something of Market is happening"
            set theContent to "This is the content, will show you how things are happeing, the world is small but people are greedy, if you want to do something"
            set theSignature to ""
            set theAttachments to {}
            set theDelay to 1
            set theMessage to make new outgoing message with properties {sender:theFrom, subject:theSubject, content:theContent, visible:false}
            tell theMessage
                repeat with theTo in theTos
                    make new recipient at end of to recipients with properties {address:theTo}
                end repeat
                (*
                repeat with theCc in theCcs
                    make new cc recipient at end of cc recipients with properties {address:theCc}
                end repeat
                repeat with theBcc in theBccs
                    make new bcc recipient at end of bcc recipients with properties {address:theBcc}
                end repeat
                repeat with theAttachment in theAttachments
                    make new attachment with properties {file name:theAttachment as alias} at after last paragraph
                    delay theDelay
                end repeat
                *)
            end tell
            # macOS 10.12+ know bug
            # https://stackoverflow.com/questions/39860859/setting-message-signature-of-outgoing-message-using-applescript
            # set message signature of theMessage to signature theSignature
            send theMessage
            
            delay 30.0
            quit
            
        end tell
        
    end sendAlertMail
    
end script
