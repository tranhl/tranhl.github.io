---
published: false
layout: post
title: Getting Started With Google Analytics
summary: Sharing my learnings with setting up and integrating Google Analytics for this blog.
category: guides
---

Having had no prior experience with analytics and reporting platforms, I found the Google Analytics on-boarding process to be a little confusing. This was understandable — the Analytics platform is mature and developed, and the main customer base is comprised of long-term users of the platform, but nevertheless, I found myself more confused than I would have liked.

This post is the guide I wish I had while starting out with Google Analytics. In the truest sense of a guide, I'll be introducing you to the various components of the Analytics platform, but not going in depth — there is a lot to the platform that simply can't be covered in a single blog post. Instead, I've included 'Further Reading' sections where appropriate, so you can take over from there. Let's get started!

## Fundamentals

Before you jump in and setup your Google Analytics account, it's important to understand some fundamental concepts that form the foundation for all of the features that Google Analytics has to offer.

### Properties

Google Analytics supports a wide array of data sources: websites, mobile apps, and even physical devices (e.g. fixed kiosks, point of sales devices, etc). Google generalises all of these data sources as ***Properties***. The word property comes from thinking about your online products as "distinct, real-world [pieces] of property, like a storefront".

Each property has an associated tracking code, and it's this tracking code that Google uses to link data back to the property. Theoretically, this means that you can use the same tracking code on two different websites, and all the data that comes in from the two websites is aggregated into the same property.

#### Further Reading

- [Properties - Analytics Help](https://support.google.com/analytics/topic/1009620?hl=en&ref_topic=1726911)

### Accounts

During the on-boarding process, one of the first things you'll be prompted to create is an ***Account***. For me, this was confusing, as when I read 'account', I think *e-mail account*. However, on Google Analytics, accounts are more akin to financial accounts. They are simply a way to aggregate and organise data from multiple Properties, as well as access to that data (in case you work with multiple people).

Accounts are flexible and configurable. You may want to only include data from a single Property in an account, such as data from your personal blog. At other times, when you have a lot of data to work with, you may wish to aggregate data from multiple blogs, websites, and apps, all into a single account to generate analytics across the board. Or, you may wish to create an account to allow special access to more sensitive data. Ultimately, how you organise your Properties will come down to what you want to understand from your traffic data, and the surrounding use cases.

#### Further Reading

- [Accounts - Analytics Help](https://support.google.com/analytics/topic/1009690?hl=en&ref_topic=1726911)

### Views

Lastly, once you've set up your Properties and grouped them into Accounts, you'll want to inspect the data in a meaningful way. That's where Views come in — they allow you to filter and isolate subsets of the data that you're working with.

A simple example would be to filter internal data, as it could provide misleading insights. Another example would be to create views for specific continents — one view for the Americas, another for Oceania, and so on. Again, it really comes down to your use case, and what you intend to derive from your data.

#### Further Reading

- [Reporting views - Analytics Help](https://support.google.com/analytics/topic/6014102?hl=en&ref_topic=1726911)

## Getting Started

Now that you have some background knowledge coming into this, it's time to set up Google Analytics. To get started, head over to the [sign up](https://analytics.google.com/analytics/web) page and click on *Start Measuring*. If you don't have a Google Account yet, you'll be prompted to create one. 

### Account Setup

Once you've created a Google Account, you'll be redirected to the on-boarding page. Here you'll set up your first Google Analytics Account (not to be confused with a Google Account). What you name the account will depend on your use case. If you can't think of anything, don't stress, you can rename it later. For me, I wanted to group together all properties underneath my personal brand, so I went ahead with `tranhl.me` as the account name.

{%
  include image.html
  url="/assets/img/g-analytics-account-setup.png"
  alt="Google Analytics account setup"
  caption="Don't worry about what you call the account. You can always change it later!"
%}

Choose an account name that fits your needs. You can always rename it later!

Next up, you'll be prompted to configure your **Account Data Sharing Settings**. Unless you have specific data and security requirements, it's best to leave these options checked. You can always circle back and change them later. Click on *Next* to proceed to the next step.

### Property Setup

Next, you'll be asked what you want to measure with Google Analytics. Select the property type that you want to track, and click *Next*. For me, I wanted to create a property that represented my blog, so I went with the *website* option. After that, you'll need to fill out the property details. The form will differ slightly depending on which property type you chose, but the form is pretty straightforward in either case.

{%
  include image.html
  url="/assets/img/g-analytics-property-setup.png"
  alt="Google Analytics property setup"
%}

Once you're done configuring your property, all you have to do is accept the terms and conditions and you'll be good to go!

### Adding Google Analytics to Your Website/App

Now that you've set everything up, it's time to add Google Analytics to your property. You should automatically be presented with the tracking code after setting everything up, but if you aren't, go to **Admin > Tracking Info > Tracking Code** (**Admin** is located on the bottom left).

To add Google Analytics to your website, simply copy the tracking code provided to you and then include it in your website's HTML `<head>` tag. If you are configuring a mobile app, you'll need to follow [Google's guide to app reporting](https://support.google.com/analytics/answer/6317479) instead.

Once you've done that, you'll be ready to start collecting traffic data! To check that everything is set up properly, just visit your website in a browser. If you're configuring a mobile app, then open it up. Note that if you have an ad blocker enabled on your browser, you'll need to disable it for your website, otherwise the Google Analytics script will be blocked. 

Next up is the **Account Data Sharing Settings**. As per the recommendation, it's best to leave thi Again, you can always change this later, but the more data you have

## Reporting

For those of you with basic analytics needs, the **Home** tab will serve you well. If what you're looking for isn't available on the Home dashboard, you can also try asking a question in the search bar at the top of the dashboard, and Google's AI engine will provide the best possible answer for you. If these use cases are good enough for you, then you can stop reading here.

However, if you need a little more out of your analytics, then you can start looking into more specific reporting options.

### Audience Reports

Audience reports are all about understanding and dissecting your user base. The questions you can expect to answer are:

- How many users do I have?
- How valuable is each demographic of user to me?
- What is the distribution of users across all of my properties?
- What is the behaviour of specific user profiles?
- Which users are most likely to convert?
- How are users engaging with my properties across a session?

#### Further Reading

- [Audience reports - Analytics Help](https://support.google.com/analytics/topic/1007027?hl=en&ref_topic=3544907)

### Acquisition Reports

Acquisition reports are all about understanding where new users are coming from. These reports are organised by *channels*, which is Analytics' term for traffic sources. Questions you can expect to answer are:

- How much traffic does each property receive?
- Through which channel am I generating the most traffic?
- What is the breakdown of new and returning users?
- How much am I spending to acquire users from these channels?

#### Further Reading

- [Acquisition reports - Analytics Help](https://support.google.com/analytics/topic/3125765?hl=en&ref_topic=3544907)

### Behavior Reports

Behavior reports help you understand what your users are doing once they've been acquired. This is achieved through the tracking of user interactions (a.k.a. *events*) throughout a session. Once events have been configured, you'll be able to understand the interaction journey that a user takes throughout your property.

#### Further Reading

- [Behavior reports - Analytics Help](https://support.google.com/analytics/topic/1120718?hl=en&ref_topic=3544907)

### Conversion Reports

Conversions are the completion of a desired action by the users of your property. Examples of conversion include:

- Sale of a product.
- Click of a call-to-action link.
- Account registration.
- Newsletter sign-up.
- QR code scan.

If your property has conversion targets, then conversion reports allow you to understand how each channel is contributing your overall sales so that you can better optimise your strategy.

#### Further Reading

- [Conversion reports - Analytics Help](https://support.google.com/analytics/topic/1631741?hl=en&ref_topic=3544907)
- [What is conversion?](https://sherpablog.marketingsherpa.com/marketing/conversion-defined/)
- [Conversion marketing - Wikipedia](https://en.wikipedia.org/wiki/Conversion_marketing)

## Closing Thoughts

If you've made it to the end of this blog post, thank you! I hope that I've helped dispel any confusion that you may have had setting up Google Analytics on your own platform. If you have any questions feel free to reach out, I'm always a [Tweet](https://twitter.com/tranhl_) away!
