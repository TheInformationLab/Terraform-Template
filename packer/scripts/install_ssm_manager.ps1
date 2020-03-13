## Systems Manager install details described here: https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-win.html

Invoke-WebRequest `
	https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe `
    -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
    
Start-Process `
	-FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe `
    -ArgumentList "/S"
    
Remove-Item -Force $env:USERPROFILE\Desktop\SSMAgent_latest.exe

Restart-Service AmazonSSMAgent