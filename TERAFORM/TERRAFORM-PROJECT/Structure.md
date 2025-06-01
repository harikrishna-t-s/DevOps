terraform-terragrunt-local/
├── terragrunt.hcl (root)
├── envs/
│   ├── dev/
│   │   ├── terragrunt.hcl (dev environment)
│   │   └── modules/
│   │       ├── network/
│   │       │   └── terragrunt.hcl
│   │       ├── server/
│   │       │   └── terragrunt.hcl
│   │       └── webapp/
│   │           └── terragrunt.hcl
│   └── prod/ (optional, to show multi-env)
│       │   ├── terragrunt.hcl (prod environment)
│   │   └── modules/
│   │       ├── network/
│   │       │   └── terragrunt.hcl
│   │       ├── server/
│   │       │   └── terragrunt.hcl
│   │       └── webapp/
│   │           └── terragrunt.hcl
└── modules/
    ├── network/
    │   └── main.tf
    ├── server/
    │   └── main.tf
    └── webapp/
        ├── main.tf
        └── index.html (our static web page)