---
layout: post
title: What the GitHub Repository Experience Is Missing
summary: File browsing. It’s missing file browsing.
category: tooling
tag: browser extension
---

File browsing. It's missing file browsing — and let's be honest, the current experience hardly counts.

Browsing files on GitHub has always been a complete pain. If you're familiar with IDEs, then you'll be accustomed to freely opening and closing folders as you navigate through your project. But sadly not on GitHub.

{%
  include image.html
  url="/assets/img/feature-preview-screenshot.png"
  alt="GitHub feature preview settings"
  caption="The new 'Repository refresh' feature preview. Access it via <i>Your avatar > Feature preview</i>."
%}

The repository refresh feature preview gave me hope that there would be an improvement to the file browsing experience, but sadly it remains the same. Click on the folder you want to drill down into, and wait for the page to load. Rinse and repeat. Want to look at a different file tree? Prepare to navigate back a couple of times. If you're smart you'll open the folders in separate tabs, that way you can just close the tab. But what if the folder you want to open isn't on the same hierarchical level? Not much luck there, a few more page loads for you.

Thankfully there are a couple of browser extensions available that directly address this issue. Let's go through my personal recommendations.

## Tako

{%
  include image.html
  url="https://github.com/brumm/tako/raw/b92ba7865f352a967235c46016104f68a1248db0/media/screenshot.png"
  alt="Tako extension preview"
%}

First up is [Tako](https://github.com/brumm/tako), the simplest option available. This extension replaces the default file browser on GitHub with an IDE-like browser, and is available on Chrome and Firefox. Files on the left, file preview on the right. 

## Octotree

{%
  include image.html
  url="https://github.com/ovity/octotree/raw/master/docs/demo.gif"
  alt="Octotree extension preview"
%}

[Octotree](https://github.com/ovity/octotree) is the most feature-packed of the bunch. Available on Chrome, Firefox, Opera, and Safari, Octotree's main feature is a detachable sidebar for browsing files and jumping to files while performing code reviews. Take note though, the code review features are locked behind a [subscription](https://www.octotree.io/pricing).

If you're someone that does most of their code reviews using GitHub's interface, and doesn't mind the subscription, then this is the extension for you.

## Gitako

{%
  include image.html
  url="https://lh3.googleusercontent.com/25rseyy37tcm6KlaA7Hi0Lhb8uGuYwH3ruVDOP4Vc5yNT_VVdUu5KThCiqZQLuLNm02NtHL2Jg=w640-h400-e365"
  alt="Gitako extension preview"
%}

[Gitako](https://github.com/EnixCoda/Gitako) provides a similar experience to Octotree, available on Chrome, Firefox, and Edge. If you aren't interested in the code review enhancements that Octotree providers, and just want the file browser experience, then Gitako is probably the way to go, as it performs faster than Octotree.

## Closing Thoughts

With everything I've said about the lackluster file browsing experience, it's important to acknowledge that maintaining an IDE-like experience is not GitHub's primary concern. Links to files on GitHub are shared across the web all the time. Ensuring that the links work 100% of the time (given that GitHub is accessible), is the top priority. A fancy file browsing experience would complicate things significantly.

Personally, I prefer Tako. It's feature packed enough while still maintaining the familiar GitHub layout. I use VSCode with the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension to do code reviews, so Octotree and Gitako are less attractive to me.

At the end of the day, it comes down to personal preference, so choose whatever works best for your workflow.
