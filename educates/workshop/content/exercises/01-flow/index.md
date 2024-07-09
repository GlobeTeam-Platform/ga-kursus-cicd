---
title: "Flow"
---

The flow we will be going thru today, looks like this.

It's split up, into Continuous Integrations (CI) and Continuous Delivery (CD), with Git in the Center as the "Source of truth"

![Flow](flow.png)

The flow is (normalily) triggered by a commit to Git, that updates the code or container, or deployment configuration.

Depending on which, a flow will be triggered automatic, that will end up with a new version of the application being deployed.

In our enviroment, we need to trigger the pipeline (CI) manualily. 

But more on that later.