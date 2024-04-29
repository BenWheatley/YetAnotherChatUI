# YetAnotherChatUI

Yet another ChatGPT UI, this one just lets you customise more & use your own API key

Motivation: I personally want a pay-as-you-go version of ChatGPT 4 rather than a monthly subscription. So I made one.

[Relevant ChatGPT link for 3.5 helping me build this UI](https://chat.openai.com/share/675a61f4-ae01-48fd-b6c8-be68b067cdbb)

## Core versions

# Web

Single-page JavaScript app: https://benwheatley.github.io/YetAnotherChatUI/

Status: It works, it's not doing anything particularly clever (and I'm not a JS developer) so has a lot of rough edges, for example if there's HTML in the input/output, that just gets dumped into the DOM and messes with the rendering.

I've noticed from using this app, that sometimes the storage system (localStorage) will get cleared for no apparent reason; because of this, I have also added import/export buttons — save early, save often.

Also serves as a way for me to learn more about JavaScript.

# SwiftUI

In order of where I will be spending my energy:

1. MacOS
2. iPad OS
3. iOS
4. WatchOS

Status: in progress.

Also serves as way for me to learn more about random Apple frameworks, including SwiftData, and if I want to use them in anything serious. (At the time of writing, April 2024, I recommend against SwiftData: nice idea, not ready).
