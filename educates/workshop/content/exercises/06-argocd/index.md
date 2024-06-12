---
title: "ArgoCD"
---

```dashboard:reload-dashboard
prefix: Open
title: Open ArgoCD
name: ArgoCD
url: {{< param ingress_protocol >}}://argocd-{{< param session_name >}}.{{< param ingress_domain >}}
```

```terminal:execute
prefix: Run
title: Get ArgoCD password from secret
command: |
    ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
    echo $ARGOCD_PASSWORD
```