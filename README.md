# Writing An Application Pin bruteforce

In this writeup I will show you how I was able to access an android application by bruteforcing the application passcode. The application I was testing implemented a 4 digit passcode to protect sensitive information from unauthorized access, After bit of testing I released that there was no rate limit implemented to protect against bruteforce attacks, which means you can keep entering the wrong passcode without getting locked out but doing it manually could take a lot of time. So I decided to write a script to bruteforce the passcode.

Challenges:-

1. Find a way to send passcode: We can use adb to send input text using `adb shell input text 1234` but it didn't worked because passcode activity was listening for the touch events on numbers in dialpad so we have to send tap on the specific location of the activity view to enter the passcode combinations.

2. Find X,Y location of each number: To do this we can use android developer setting option pointer location to get X,Y of each number or capture the screenshot of the passcode activity view and 
