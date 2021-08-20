@echo off

set shadersFolder=%1
set shouldPause=%2

pushd %shadersFolder%

if not exist "compiled/" mkdir compiled

for /f %%f in ('dir /b *.vert *.frag') do (
	C:/VulkanSDK/1.2.182.0/Bin32/glslc.exe %shadersFolder%%%f -o compiled/%%f.spv || goto error
)

popd

if not defined shouldPause (pause) else (exit 0)
exit 0

:error
popd
if not defined shouldPause (pause) else (exit %ERRORLEVEL%)
exit %ERRORLEVEL%