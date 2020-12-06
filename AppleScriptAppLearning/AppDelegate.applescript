--
--  AppDelegate.applescript
--  AppleScriptAppLearning
--
--  Created by mrliu on 2020/12/6.
--  
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
	
    -- 先声明，之后xib中连线可以看到该属性
    property theTextFiled : missing value
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
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
    
end script
